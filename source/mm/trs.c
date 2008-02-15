/*

trs.c -- read transcription table from file

History:
  24-DEC-1992 added ability to look in directory given by home
  06-JUL-1992 Genesis (Jeroen Hellingman)

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "readfile.h"
#include "trs.h"
#include "mm.h"

extern char *progname;
extern int verbose;

static PSTree *read_table(FILE *f);

trs_table *read_trs(char *filename)
{   int stop = FALSE;
    char b[BUFSIZE];
    char *command=b;
    string_list *rest=NULL;
    trs_table *result = NULL;
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
    if(verbose) printf("reading transcription from %s\n", filename);

    result=malloc(sizeof(trs_table));
    if(result==NULL){fprintf(stderr,"can't allocate\n");exit(0);}

    while(!stop)
    {   get_command(f, command, &rest);
        if(command == NULL || strcmp(command, "end")==0)
        {   if(result->p == NULL ||
               result->atbegin == NULL ||
               result->atend == NULL)
            {   fprintf(stderr, "%s: invalid transcription file &s:\n", progname, filename);
                if(result->p == NULL)
                    fprintf(stderr, "no @table given\n");
                if(result->atbegin == NULL)
                    fprintf(stderr, "no @atbegin given\n");
                if(result->atend == NULL)
                    fprintf(stderr, "no @atend given\n");
                exit(1);
            }
            stop = TRUE;
        }
        else
        {   if(strcmp(command, "atbegin")==0)
                result->atbegin = rest;
            else
            {   if(strcmp(command, "atend")==0)
                result->atend = rest;
                else
                {   if(strcmp(command, "table")==0)
                        result->p = read_table(f);
                }
            }
        }
    }
    return result;
}

static PSTree *read_table(FILE *f)
{   PSTree      *result = NULL;
    string_list *l, *n;
    char        *pattern;
    char        b[BUFSIZE];
    char        *action = b;
    char        *tmp = NULL;
    int         i = 1;              /* length of action string */
    int         no_parameters;

    while(TRUE)
    {   int ignore = FALSE;
        l = get_line(f);
        if(l==NULL)
            return result;
        else
        {
            /* pattern at position 1 */
            pattern = l->s;
            n = l->n;
            free(l);
            if(n==NULL)
            {   fprintf(stderr, "incomplete line\n");
                ignore = TRUE;
            }
            else
            {   /* command pattern at position 2    */
                action[0] = (n->s)[0];  /* single letter commands */
                action[1] = '\0';       /* NULL terminate */
                switch(action[0])
                {   case 'f':
                    case 't':
                    case 's': no_parameters = 0; break;
                    default : no_parameters = 1;
                }
                /* parameters pattern at position 3 */
                while(no_parameters > 0)
                {   no_parameters--;
                    l = n->n;
                    free(n);
                    n = l;
                    if(l==NULL)
                    {   fprintf(stderr, "incomplete line\n");
                        ignore = TRUE;
                        break;
                    }
                    else
                    {   if (++i >= BUFSIZE)
                        {   fprintf(stderr, "line too long\n");
                            ignore = TRUE;
                            break;
                        }
                        if ((i+=(int)strlen(l->s)) >= BUFSIZE)
                        {   fprintf(stderr, "line too long\n");
                            ignore = TRUE;
                            break;
                        }
                        action = strcat(action, l->s);
                    }
                }
            }
        }
        if(!ignore)
        {   tmp = malloc(strlen(action));
            if(tmp==NULL){fprintf(stderr,"can't allocate\n");exit(1);}
            strcpy(tmp, action);
            PSTinsert(&result, pattern, tmp);
        }
    }
}
