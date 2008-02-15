/*

scr.c -- read script table from file

History:
  26-APR-1993 changed directory structure of source files (JH)
  24-DEC-1992 added ability to look in directory given by home
  08-OCT-1992 added support for at{end|begin}syllabe (JH)
  21-JUL-1992 added support for reepham (JH)
  06-JUL-1992 Genesis (Jeroen Hellingman)

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "scr.h"
#include "mm.h"

extern char *progname;
extern int verbose;

static AVLtree *read_prebuild(FILE *f);
static AVLtree *read_table(FILE *f);


scr_table *read_scr(char *filename)
{   int stop = FALSE;
    char b[BUFSIZE];
    char *command=b;
    string_list *rest=NULL;
    scr_table *result = NULL;
    FILE *f;

    f = fopen(filename, "r");
    if(f==NULL)
    {   filename = prepend_home(filename);
        f = fopen(filename, "r");
            if(f==NULL)
        {   fprintf(stderr, "%s: can't open %s\n", progname, filename);
            exit(1);
        }
    }
    if(verbose) printf("reading script definition from %s\n", filename);

    result=malloc(sizeof(scr_table));
    if(result==NULL){fprintf(stderr,"can't allocate\n");exit(0);}

    result->prebuild = NULL;
    result->primary = NULL;
    result->secondary = NULL;
    result->atbegin = NULL;
    result->atend = NULL;
    result->atbeginsyllabe = "";
    result->atendsyllabe = "";
    result->reepham = FALSE;

    get_command(f, command, &rest);
    if(strcmp(command, "malayalam")!=0)
    {   fprintf(stderr, "%s: script type is not malayalam\n", progname);
        exit(0);
    }
    result->script_type = MALAYALAM_SCRIPT;

    while(!stop)
    {   get_command(f, command, &rest);
        if(command == NULL || strcmp(command, "end")==0)
        {   if(result->prebuild == NULL ||
               result->atbegin == NULL ||
               result->atend == NULL)
            {   fprintf(stderr, "%s: invalid script file &s:\n", progname, filename);
                if(result->prebuild == NULL)
                    fprintf(stderr, "no @prebuild given\n");
                if(result->atbegin == NULL)
                    fprintf(stderr, "no @atbegin given\n");
                if(result->atend == NULL)
                    fprintf(stderr, "no @atend given\n");
                exit(1);
            }
            stop = TRUE;
        }
        else /* handle commmands */
        {   if(strcmp(command, "atbegin")==0)
                result->atbegin = rest->s;
            else
            {   if(strcmp(command, "atend")==0)
                result->atend = rest->s;
            else
            {   if(strcmp(command, "prebuild")==0)
                    result->prebuild = read_prebuild(f);
            else
            {   if(strcmp(command, "primary")==0)
                    result->primary = read_table(f);
            else
            {   if(strcmp(command, "secondary")==0)
                    result->secondary = read_table(f);
            else
            {   if(strcmp(command, "reepham")==0)
                    result->reepham = TRUE;
            else
            {   if(strcmp(command, "atbeginsyllabe")==0)
                    result->atbeginsyllabe = rest->s;
            else
            {   if(strcmp(command, "atendsyllabe")==0)
                    result->atendsyllabe = rest->s;
            else
            {   fprintf(stderr, "unknown command @%s ignored\n", command);
            }
        }}}}}}}}
    }
    return result;
}

prebuild_char *new_prebuild_char(char *c, char *g)
{   prebuild_char *result = NULL;

    result = malloc(sizeof(prebuild_char));
    if(result==NULL){fprintf(stderr,"can't allocate\n");exit(0);}

    result->c = c;
    result->g = g;

    return result;
}

int cmp_prebuild_char(void *a, void *b)
{   return strcmp(((prebuild_char*)a)->c, ((prebuild_char*)b)->c);
}

static AVLtree *read_prebuild(FILE *f)
{   AVLtree *result = NULL;
    string_list *l;

    while((l = get_line(f)) != NULL)
    {
        if(l->n==NULL)
        {   fprintf(stderr, "incomplete line\n");
        }
        else
        {   prebuild_char *p = new_prebuild_char(l->s, l->n->s);
            AVLinsert(p, &result, cmp_prebuild_char);
        }
    }
    return result;
}

glyph_pair *new_glyph_pair(char *c, char *b, char *a)
{   glyph_pair *result = NULL;

    result = malloc(sizeof(glyph_pair));
    if(result==NULL){fprintf(stderr,"can't allocate\n");exit(0);}

    result->c = c;
    result->b = b;
    result->a = a;

    return result;
}

int cmp_glyph_pair(void *a, void *b)
{   return strcmp(((glyph_pair*)a)->c, ((glyph_pair*)b)->c);
}

static AVLtree *read_table(FILE *f)
{   AVLtree *result = NULL;
    string_list *l;

    while((l = get_line(f)) != NULL)
    {
        if(l->n==NULL || l->n->n == NULL)
        {   fprintf(stderr, "incomplete line\n");
        }
        else
        {   glyph_pair *p = new_glyph_pair(l->s, l->n->s, l->n->n->s);
            AVLinsert(p, &result, cmp_glyph_pair);
        }
    }
    return result;
}





