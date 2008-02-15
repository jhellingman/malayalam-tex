/*+

TITLE:  AVLtree.c   general purpose balanced trees.

DESCRIPTION:
    General purpose binairy-tree functions. This package uses AVL-trees
    to ensure proper balancing. (The heigth of the tree will never exceed
    ceil(1.44 * lg(n)), where lg is the logarithm base 2 and n the number
    of elements.) This package can be used to store any kind of data in a
    binairy tree. The only thing you have to do is to include AVLtree.h,
    link AVLtree.lib and call the appropriate functions. You should also
    provide a function to compare elements, and to free the memory used
    by elements.

USAGE:
    To use the AVLtree package, include the file AVLtree.h in your
    program. A root of a binairy tree can then be declared as follows:

    AVLtree *a_binairy_tree;

    The following operations are defined for Binairy trees:

        --  Insert an element in the tree
        --  Delete an element in the tree
        --  Find an element in the tree
        --  Traverse the tree

    These operations are described below. You should always change the
    AVLtree structure by these functions. Don't go jamming in its
    structure yourself: it's delicate.

FUNCTIONS:
    Inserting an element:
        Use the function AVLinsert() to insert an element. Its
        prototype is:

        int AVLinsert(const void *element,
                     AVLtree **root,
                     int (*cmp)(void*, void*));

        element is a pointer to the element you want to insert in the
        tree. Since it is this pointer that is actually stored in the
        AVL-tree, you should not touch the space it is pointing at
        after its insertion in the tree.
        root is a pointer to a pointer to the root node of the tree.
        A double reference is needed, since the root can change.
        cmp() is a user defined function. It should compare two
        elements and return 0 if the elements are equal, 1 if the first
        element is 'bigger' than the second, and -1 if the first
        element is 'smaller' than the second.

        The function will return one of the following codes:

            --  AVL_OK      everything is alright.
            --  AVL_DUP     attempt to insert element already present.
            --  AVL_NO_MEM  no memory could be allocated.
            --  AVL_ERROR   called with incorrect parameters.

    Deleting an element:
        Use the function AVLdelete() to delete an element from the
        tree. Its prototype is:

        int AVLdelete(const void *element,
                     AVLtree **root,
                     int (*cmp)(void*, void*),
                     void (*del)(void*));

        element is the element to be deleted from the tree.
        root and cmp() are the same as in AVLinsert(). del() is a user
        defined function that should free the memory occupied by the
        element in the tree. It is passed a pointer to the element to
        be deleted.

        The function will return one of the following codes:

            --  AVL_OK      everything is alright.
            --  AVL_NO_DEL  attemp to delete non-existant element.
            --  AVL_ERROR   called with incorrect parameters.

    Finding an element:
        To find an element, the function AVLfind() should be used. Its
        prototype is:

        void *AVLfind(const void *element,
                     AVLtree *root,
                     int (*cmp)(void*, void*));

        element is the element to be found, root is a pointer the the
        root node of the tree. cmp() is the same as in AVLinsert().

        The function will return a pointer to the found element, or
        NULL if the element could not be found.

    Traversing the tree:
        The tree can be traversed in three ways:

            --  preorder        AVLpreorder()
            --  inorder         AVLinorder()
            --  postorder       AVLpostorder()

        Inorder traversal will yield all elements in their correct
        order.

        The prototypes are:

        void AVLpreorder(AVLtree *root, void (*func)(void*));
        void AVLinorder(AVLtree *root,void (*func)(void*));
        void AVLpostorder(AVLtree *root,void (*func)(void*));

        root is a pointer to the tree to be traversed, and
        func() is a user defined function that will be called at
        every node. This could do something with that element, like
        printing it.

        These functions return nothing.

DOCUMENTATION:
    Robert L. Kruse, "Data Structures and Program Design" (2nd Ed.)
    pp. 344-356.

AUTHOR:
    Jeroen Hellingman, 't Zand 2, 4133TB Vianen, the Netherlands.

COPYRIGHT:
    Copyright (c) Jeroen Hellingman 1990.
    License is granted for any non-commercially and non-millitary use
    of this package, provided that this notice is kept intact. Use of
    this software in any product that is sold for profit or usage by
    (semi-)militairy organisations is forbidden. (contact me for
    commercial usage) Donations are always appreciated (postbank
    giro 5025409).

CAVEAT:
    I can take no responseability whatsoever if this software
    is malfunctioning. If you find any bug in it, please fix it and
    notice me. If you can't fix it, you can also notice me, I might
    try to fix it.

HISTORY
    04-MAY-1998 recompiled on MAC (JH)
    18-DEC-1992 last edit
    04-NOV-1992 declared static functions static in prototype too.
                gcc seems to complain about this (JH)
    01-DEC-1989 creation (Jeroen Hellingman)

-*/

/* #define TEST */

#include "avltree.h"
#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>

#ifndef TRUE
  #define TRUE 1
  #define FALSE 0
#endif

#define EQUAL   0
#define LEFT    1
#define RIGHT   2

/* ANSI C prototypes */

static int insert(void *element, AVLtree **root,
    int (*cmp)(void*, void*), int *taller);
static int delete(void *element, AVLtree **root,
    int (*cmp)(void*, void*), void (*del)(void*), int *shorter);
static void left_balance(AVLtree **root);
static void right_balance(AVLtree **root);
static void left_rebalance(AVLtree **root, int *shorter);
static void right_rebalance(AVLtree **root, int *shorter);
static void left_rotate(AVLtree **root);
static void right_rotate(AVLtree **root);
static void error(int errno);

/* add element to AVL-tree */

int AVLinsert(void *element,AVLtree **root,int (*cmp)(void*, void*))
{   int taller = FALSE;

    if(element == NULL) return AVL_ERROR;
    return insert(element, root, cmp, &taller);
}

int AVLdelete(void *element,AVLtree **root,int (*cmp)(void*, void*),
                void (*del)(void *))
{   int shorter = FALSE;

    if(element == NULL) return AVL_ERROR;
    return delete(element, root, cmp, del, &shorter);
}

static int insert(void *element, AVLtree **root,
                                int (*cmp)(void*, void*), int *taller)
{   int result;
    int tallersubtree = FALSE;
    AVLtree *subtree;   /* needed since you can't do & on a struct member */

    if(*root == NULL)                       /* then adding is really easy */
    {   *root = (AVLtree *) malloc(sizeof(AVLtree));
        if(*root == NULL) return AVL_NO_MEM;
        (*root)->element = element;
        (*root)->balance = EQUAL;
        (*root)->left = NULL;
        (*root)->right = NULL;
        *taller = TRUE;
        result = AVL_OK;
    }
    else                    /* recursively insert in appropriate subtree */
    {   int compare = (*cmp)(element,(*root)->element);

        if(compare == 0) return AVL_DUP;
        else if(compare < 0)
        {   subtree = (*root)->left;
            result = insert(element,&subtree,cmp,&tallersubtree);
            (*root)->left = subtree;
            if(tallersubtree)
                switch((*root)->balance)
                {   case LEFT:  left_balance(root);
                                *taller = FALSE;
                                break;
                    case EQUAL: (*root)->balance = LEFT;
                                *taller = TRUE;
                                break;
                    case RIGHT: (*root)->balance = EQUAL;
                                *taller = FALSE;
                }
            else *taller = FALSE;
        }
        else
        {   subtree = (*root)->right;
            result = insert(element,&subtree,cmp,&tallersubtree);
            (*root)->right = subtree;
            if(tallersubtree)
                switch((*root)->balance)
                {   case RIGHT: right_balance(root);
                                *taller = FALSE;
                                break;
                    case EQUAL: (*root)->balance = RIGHT;
                                *taller = TRUE;
                                break;
                    case LEFT:  (*root)->balance = EQUAL;
                                *taller = FALSE;
                }
            else *taller = FALSE;
        }
    }
    return result;
} /* end of insert() */

static int delete(void *element, AVLtree **root,
                int (*cmp)(void*, void*), void (*del)(void*), int *shorter)
{   int     result;
    int     compare;
    int     shortersubtree = FALSE;
    AVLtree *subtree;

    if(root == NULL) return AVL_ERROR;
    if((*root) == NULL) return AVL_NO_DEL;
    if((*root)->element == NULL) error(6); /* DEBUG */
    compare = (*cmp)(element,(*root)->element);

    if(compare == 0)
    {
        /* check: two children? */
        if((*root)->left != NULL && (*root)->right != NULL)
        {   AVLtree *pred;
            void    *tmp;

            /* find immediate predecessor */
            pred = (*root)->left;
            while(pred->right != NULL) pred = pred->right;

            /* swap element to be deleted with its immediate predecessor */
            tmp = (*root)->element;
            (*root)->element = pred->element;
            pred->element = tmp;

            /* delete predecessor from left subtree */
            subtree = (*root)->left;
            result = delete(element,&subtree,cmp,del,&shortersubtree);
            (*root)->left = subtree;

            /* rebalance tree */
            if(shortersubtree)
                switch((*root)->balance)
                {   case RIGHT: right_rebalance(root,shorter);
                                break;
                    case EQUAL: (*root)->balance = RIGHT;
                                *shorter = FALSE;
                                break;
                    case LEFT:  (*root)->balance = EQUAL;
                                *shorter = TRUE;
                }

        }
        else
        {   /* user must delete his element */

            (*del)((*root)->element);
            /* delete node */
            subtree = ((*root)->left == NULL) ? (*root)->right : (*root)->left;
            free(*root);
            *root = subtree;
            *shorter = TRUE;
            result = AVL_OK;
        }
    }
    else if(compare < 0)    /* delete from left subtree */
    {   subtree = (*root)->left;
        result = delete(element, &subtree, cmp, del, &shortersubtree);
        (*root)->left = subtree;

        /* rebalance tree */
        if(shortersubtree)
            switch((*root)->balance)
            {   case RIGHT: right_rebalance(root,shorter);
                            break;
                case EQUAL: (*root)->balance = RIGHT;
                            *shorter = FALSE;
                            break;
                case LEFT:  (*root)->balance = EQUAL;
                            *shorter = TRUE;
            }
    }
    else    /* delete from right subtree */
    {   subtree = (*root)->right;
        result = delete(element, &subtree, cmp, del, &shortersubtree);
        (*root)->right = subtree;

        /* rebalance tree */
        if(shortersubtree)
            switch((*root)->balance)
            {   case LEFT:  left_rebalance(root,shorter);
                            break;
                case EQUAL: (*root)->balance = LEFT;
                            *shorter = FALSE;
                            break;
                case RIGHT: (*root)->balance = EQUAL;
                            *shorter = TRUE;
            }
    }
    return result;
} /* end of delete() */

static void right_rebalance(AVLtree **root, int *shorter)
{   AVLtree *rightsub, *leftsubsub;

    if(root == NULL) error(7);
    if(*root == NULL) error(8);
    if((*root)->right == NULL) error(9); /* DEBUG */

    rightsub = (*root)->right;
    switch(rightsub->balance)
    {   case EQUAL: (*root)->balance = RIGHT;
                    rightsub->balance = LEFT;
                    left_rotate(root);
                    *shorter = FALSE;
                    break;
        case RIGHT: (*root)->balance = EQUAL;
                    rightsub->balance = EQUAL;
                    left_rotate(root);
                    *shorter = TRUE;
                    break;
        case LEFT:  leftsubsub = rightsub->left;
                    switch(leftsubsub->balance)
                    {   case EQUAL: (*root)->balance = EQUAL;
                                    rightsub->balance = EQUAL;
                                    break;
                        case LEFT:  (*root)->balance = EQUAL;
                                    rightsub->balance = RIGHT;
                                    break;
                        case RIGHT: (*root)->balance = LEFT;
                                    rightsub->balance = EQUAL;
                    }
                    leftsubsub->balance = EQUAL;
                    right_rotate(&rightsub);
                    (*root)->right = rightsub;
                    left_rotate(root);
                    *shorter = TRUE;
    }
} /* end of right_rebalance() */

static void left_rebalance(AVLtree **root, int *shorter)
{   AVLtree *leftsub, *rightsubsub;

    if(root == NULL) error(10);
    if(*root == NULL) error(11);
    if((*root)->left == NULL) error(12); /* DEBUG */

    leftsub = (*root)->left;
    switch(leftsub->balance)
    {   case EQUAL: (*root)->balance = LEFT;
                    leftsub->balance = RIGHT;
                    right_rotate(root);
                    *shorter = FALSE;
                    break;
        case LEFT:  (*root)->balance = EQUAL;
                    leftsub->balance = EQUAL;
                    right_rotate(root);
                    *shorter = TRUE;
                    break;
        case RIGHT: rightsubsub = leftsub->right;
                    switch(rightsubsub->balance)
                    {   case EQUAL: (*root)->balance = EQUAL;
                                    leftsub->balance = EQUAL;
                                    break;
                        case RIGHT: (*root)->balance = EQUAL;
                                    leftsub->balance = LEFT;
                                    break;
                        case LEFT:  (*root)->balance = RIGHT;
                                    leftsub->balance = EQUAL;
                    }
                    rightsubsub->balance = EQUAL;
                    left_rotate(&leftsub);
                    (*root)->left = leftsub;
                    right_rotate(root);
                    *shorter = TRUE;
    }
} /* end of left_rebalance() */

void *AVLfind(void *element,AVLtree *root,int (*cmp)(void*, void*))
{   int compare;

    if(root == NULL) return NULL;
    compare = (*cmp)(element,root->element);
    if(compare == 0) return root->element;
    else if(compare < 0)
        return AVLfind(element,root->left,cmp);
    else
        return AVLfind(element,root->right,cmp);
}

static void left_balance(AVLtree **root)
{   AVLtree *leftsub, *rightsubsub;

    leftsub = (*root)->left;
    switch(leftsub->balance)
    {   case LEFT:  (*root)->balance = EQUAL;
                    leftsub->balance = EQUAL;
                    right_rotate(root);
                    break;
        case RIGHT: rightsubsub = leftsub->right;
                    switch(rightsubsub->balance)
                    {   case EQUAL: (*root)->balance = EQUAL;
                                    leftsub->balance = EQUAL;
                                    break;
                        case RIGHT: (*root)->balance = EQUAL;
                                    leftsub->balance = LEFT;
                                    break;
                        case LEFT:  (*root)->balance = RIGHT;
                                    leftsub->balance = EQUAL;
                    }
                    rightsubsub->balance = EQUAL;
                    left_rotate(&leftsub);
                    (*root)->left = leftsub;
                    right_rotate(root);
    }
} /* end of left_balance() */

static void right_balance(AVLtree **root)
{   AVLtree *rightsub, *leftsubsub;

    rightsub = (*root)->right;
    switch(rightsub->balance)
    {   case RIGHT: (*root)->balance = EQUAL;
                    rightsub->balance = EQUAL;
                    left_rotate(root);
                    break;
        case LEFT:  leftsubsub = rightsub->left;
                    switch(leftsubsub->balance)
                    {   case EQUAL: (*root)->balance = EQUAL;
                                    rightsub->balance = EQUAL;
                                    break;
                        case LEFT:  (*root)->balance = EQUAL;
                                    rightsub->balance = RIGHT;
                                    break;
                        case RIGHT: (*root)->balance = LEFT;
                                    rightsub->balance = EQUAL;
                    }
                    leftsubsub->balance = EQUAL;
                    right_rotate(&rightsub);
                    (*root)->right = rightsub;
                    left_rotate(root);
    }
} /* end of right_balance() */

static void left_rotate(AVLtree **root)
{
    if(*root == NULL) error(1);
    else if((*root)->right == NULL) error(2);
    else
    {   AVLtree *temp;

        temp = (*root)->right;
        (*root)->right = temp->left;
        temp->left = *root;
        *root = temp;
    }
}

static void right_rotate(AVLtree **root)
{
    if(*root == NULL) error(3);
    else if((*root)->left == NULL) error(5);
    else
    {   AVLtree *temp;

        temp = (*root)->left;
        (*root)->left = temp->right;
        temp->right = *root;
        *root = temp;
    }
}

void AVLinorder(AVLtree *root, void (*func)(void*))
{
    if(root == NULL) return;

    AVLinorder(root->left, func);
    (*func)(root->element);
    AVLinorder(root->right, func);
}

void AVLpreorder(AVLtree *root, void (*func)(void*))
{
    if(root == NULL) return;

    AVLpreorder(root->left, func);
    AVLpreorder(root->right, func);
    (*func)(root->element);
}

void AVLpostorder(AVLtree *root, void (*func)(void*))
{
    if(root == NULL) return;

    (*func)(root->element);
    AVLpostorder(root->left, func);
    AVLpostorder(root->right, func);
}


static void error(int errno)
{   fprintf(stderr,"AVLtree package error # %d\n",errno);
    exit(1);
}


#ifdef TEST

#include <string.h>

#define MAXN    1000
#define BUFSIZE 512

int fgetline(char *buf, FILE *input);
int cmp(void*, void*);
void del(void *p1);
void show_element(void *element);
int AVLcheck(AVLtree *root);
void AVLshowtree(AVLtree *root, void (*func)(void*),  int depth);

void AVLshowtree(AVLtree *root, void (*func)(void*),  int depth)
{
    if(root == NULL) return;

    printf(" [%d](%d) ",root->balance, depth);
    (*func)(root->element);
    AVLshowtree(root->left, func, depth+1);
    AVLshowtree(root->right, func, depth+1);
}

/* naive compare using strcmp() (ASCII order) */

int cmp(void *p1, void *p2)
{   return strcmp(p1, p2);
}

/* routine to delete an element */

void del(void *p1)
{   free(p1);
}

/* simple routine to show a node */

void show_element(void *element)
{   printf("%s\n",element);
}

void main()
{   AVLtree *root = NULL;
    char    buf[BUFSIZE];
    int     n = 0, length;
    char    *p;


    fprintf(stdout,"testing routine for B-tree package\n");
    fprintf(stdout,"just read lines from input, put them in the\n");
    fprintf(stdout,"tree, then traverse the tree in order to\n");
    fprintf(stdout,"show the lines sorted (stop with '-') \n");

    while(TRUE)
    {   length = fgetline(buf, stdin);
        if(buf[0] == '-') break;
        if(length != 0)
        {   if(n == MAXN)
            {   fprintf(stderr, "Too many strings\n");
                exit(1);
            }
            p = malloc(length+1);
            if(p == NULL)
            {   fprintf(stderr, "Out of memory\n");
                exit(2);
            }
            strcpy(p, buf);
            if(AVLinsert(p,&root,cmp) != AVL_OK)
            {   fprintf(stderr, "Insertion error\n");
            }
            AVLcheck(root);
            ++n;
        }
        if(feof(stdin)) break;
    }

    /* check tree */
    AVLcheck(root);
    /* now try to delete some elements */

    while(TRUE)
    {   length = fgetline(buf, stdin);
        if(length != 0)
        {   if(n == MAXN)
            {   fprintf(stderr, "Too many strings\n");
                exit(1);
            }
            p = malloc(length+1);
            if(p == NULL)
            {   fprintf(stderr, "Out of memory\n");
                exit(2);
            }
            strcpy(p, buf);
            if(AVLdelete(p,&root,cmp,del) != AVL_OK)
            {   fprintf(stderr, "Deletion error\n");
            }
            AVLcheck(root);
            ++n;
        }
        if(feof(stdin)) break;
    }

    AVLshowtree(root,show_element, 1);

    exit(0);
}

int fgetline(char *buf, FILE *input)
{   int i = 0, tmp;

    while((tmp = getc(input)) != EOF)
    {   buf[i] = (char)tmp;
        if(buf[i] == '\n')
        {   buf[i] = '\0';
            return i;
        }
        else
        {   i++;
            if(i >= BUFSIZE)
            {   fprintf(stderr, "line too long\n");
                exit(4);
            }
        }
    }
    buf[i] = '\0';
    return i;
}

int AVLcheck(AVLtree *root)
{   int lh, rh;

    if(root == NULL) return 0;

    lh = AVLcheck(root->left);
    rh = AVLcheck(root->right);

    if(lh == rh && root->balance != EQUAL)
        printf("improper balance EQUAL\n");
    if(lh - rh == 1 && root->balance != LEFT)
        printf("improper balance LEFT\n");
    if(lh - rh == -1 && root->balance != RIGHT)
        printf("improper balance RIGHT\n");
    if(lh - rh > 1 || lh - rh < -1) printf("Not an AVL-tree\n");

    return (lh < rh ? rh : lh) + 1;
}

#endif  /* TESTing part */

/* end of AVLtree.c */
