/*+
    AVLtree.h   header file for generic binairy-tree package

    (c) Jeroen Hellingman, 1 dec 1989.

-*/

#ifndef AVLTREE_HEADER_READ
#define AVLTREE_HEADER_READ

/* return values */

#define AVL_OK      0
#define AVL_ERROR   1
#define AVL_NO_MEM  2
#define AVL_DUP     3
#define AVL_NO_DEL  4

/* AVLtree structure */

typedef struct AVLtree AVLtree;

struct AVLtree
{   void    *element;
    char    balance;
    AVLtree *left;
    AVLtree *right;
};

/* ANSI C prototypes */

int AVLinsert(void *element,AVLtree **root,int (*cmp)(void*, void*));
int AVLdelete(void *element,AVLtree **root,int (*cmp)(void*, void*),void (*del)(void*));

void *AVLfind(void *element,AVLtree *root,int (*cmp)(void*, void*));

/* traversal routines */

void AVLpreorder(AVLtree *root, void (*func)(void*));
void AVLinorder(AVLtree *root,void (*func)(void*));
void AVLpostorder(AVLtree *root,void (*func)(void*));

#endif
/* end of AVLtree.h */
