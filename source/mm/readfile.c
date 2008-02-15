/*

readfile.c -- read a command file

get lines from a file, split up into "words", separated by spaces
skip whitespace and comments, treats strings as a unit, interpretes
C-like escape codes

@ starts command
% starts comment
\ starts escape code
" starts and ends string

everything before the first command is considered comment,
everything after @end also

HISTORY:
  19-NOV-1992 restructuring of program (JH)
  22-JUL-1992 removed bug causing COMMENTCHAR in string to be interpreted (JH)

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "readfile.h"

static char *read_line(FILE *f, char *s, int n);
static char *read_cline(FILE *f, char *s, int n);
static char *strlow(char *s);
static string_list *make_string_list(char *s);
static void skip_spaces(FILE *f);
static void skip_line(FILE *f);
static int getword(char *s, char *d);
static int getquotedstring(const char *s, char *d);
static int what_escape(const char *s, char *result);
static string_list *get_cline(FILE *f);

/********/

char *get_command(FILE *f, char *command, string_list **rest)
{
    string_list *l;
    /* get first line starting with "@" */
    do
    {   l = get_cline(f);
        if(l == NULL)
        {   return NULL;
        }
    }
    while(l->s[0] != COMMANDCHAR);

    strcpy(command, &(l->s)[1]);
    strlow(command);
    *rest = l->n;
    free(l);
    return command;
}

static char *strlow(char *s)
{   char *t = s;
    while(*t!='\0') { *t = tolower(*t); t++; }
    return s;
}

static string_list *get_cline(FILE *f)
{   char buffer[BUFSIZE], *s = buffer;
    s = read_cline(f, s, BUFSIZE);
    return make_string_list(s);
}

string_list *get_line(FILE *f)
{   char buffer[BUFSIZE], *s = buffer;
    s = read_line(f, s, BUFSIZE);
    return make_string_list(s);
}

static string_list *make_string_list(char *s)
{
    char d[BUFSIZE];
    int i = 0;
    string_list *result = NULL;
    string_list **previous = &result;
    string_list *current = NULL;
    int empty_quoted_string;

    /* break line up into words */
    do
    {   empty_quoted_string = FALSE;
        while(isspace(s[i]) && s[i] != '\0' && s[i] != COMMENTCHAR) i++;
        if(s[i] == COMMENTCHAR) break;
        if(s[i] == '"')
        {   i += getquotedstring(&s[i], d);
            if(d[0]=='\0') empty_quoted_string = TRUE;
        }
        else i += getword(&s[i], d);
        if(d[0] != '\0' || empty_quoted_string)
        {   /* insert at end in string list */
            long len;
            *previous = current = (string_list*)malloc(sizeof(string_list));
            if(current==NULL){fprintf(stderr,"can't allocate");exit(1);}
            current->n = NULL;
            len = strlen(d);
            len = (len==0) ? 1 : len;
            current->s = (char*)malloc(len);
            if(current->s==NULL){fprintf(stderr,"can't allocate");exit(1);}
            strcpy(current->s, d);

            #ifdef DEBUG
            fprintf(stderr, "make_string_list: element: %s\n", current->s);
            #endif

            previous = &(current->n);
        }
    }
    while(s[i] != '\0' && i < BUFSIZE);
    return result;
}


static char *read_cline(FILE *f, char *s, int n)
/* read until <EOF> or <NL> */
{
    int c;
    int i = 0;

    skip_spaces(f);
    do
    {   c=getc(f);
        s[i++] = (char)c;
        if(i>=n)
        {   fprintf(stderr, "buffer full, skipping rest of line\n");
            skip_line(f);
            break;
        }
    }
    while (c != EOF && c!= '\n');
    s[--i]='\0';

    #ifdef DEBUG
    fprintf(stderr, "read_cline: %s\n", s);
    #endif

    return s;
}

static char *read_line(FILE *f, char *s, int n)
/* read until <EOF>, COMMANDCHAR or <NL> */
{
    int c;
    int i = 0;

    skip_spaces(f);
    do
    {   c=getc(f);
        s[i++] = (char)c;
        if(i>=n)
        {   fprintf(stderr, "buffer full, skipping rest of line\n");
            skip_line(f);
            break;
        }
        if(i == 1 && c==COMMANDCHAR)
        {   ungetc(c, f);
            s[0] = '\0';
            #ifdef DEBUG
            fprintf(stderr, "read_line: \"\0\" \n");
            #endif
            return s;
        }
    }
    while (c != EOF && c!= '\n');
    s[--i]='\0';

    #ifdef DEBUG
    fprintf(stderr, "read_line: %s\n", s);
    #endif

    return s;
}

static void skip_spaces(FILE *f)
/* skip white space and comment */
{   int c;
    do
    {   c=getc(f);
        while(c==COMMENTCHAR) { skip_line(f); c = getc(f); }
    }
    while(isspace(c) || c == '\n');
    ungetc(c, f);
}

static void skip_line(FILE *f)
/* skip until <NL> */
{   int c;
    do { c=getc(f); } while(c != EOF && c != '\n');
}

static int getword(char *s, char *d)
{   int i = 0, j = 0;
    while(isspace(s[i]) && s[i] != '\0') i++;
    while(!isspace(s[i]) && s[i] != '\0') { d[j] = s[i]; j++; i++; }
    d[j] = '\0';
    return i;
}

static int getquotedstring(const char *s, char *d)
{   int i = 0;  /* no of chars read in source */
    int j = 0;  /* no of chars inserted in destination */
    while(isspace(s[i]) && s[i] != '\0') i++;

    if(s[i] == '"')
    {   i++;
        while(s[i] != '"')
        {   if(s[i] == '\\') /* escape char */
                i += what_escape(&s[i], &d[j]);
            else
            {   d[j] = s[i];
            }
            j++; i++;
        }
    }
    d[j] = '\0';    /* NULL-terminate */
    i++;            /* skip final " */
    return i;
}

/* Find out what escape sequence is used. If non can be found, we just
   forget about the backslash. Interprete numbers up to 255/177/FF
*/

#define UNSIGNED(t) (char)(((t) < 0) ? (t) + 256 : (t))

static int what_escape(const char *s, char *result)
{   int i = 1;      /* length of escape sequence read */
    int ok = TRUE;
    int t = 0;      /* temporary result */

    switch(s[1])
    {   case '"':   *result = '"';  break;
        case '\\':  *result = '\\'; break;
        case 't':   *result = '\t'; break;
        case 'n':   *result = '\n'; break;
        case 'b':   *result = '\b'; break;
        case 'h':   /* hexadecimal */
            while(i < 3 && ok)
            {   i++;
                if(s[i]>='0' && s[i]<='9') t = t * 16 + (s[i] - '0');
                else if(s[i]>='A' && s[i]<='F') t = t * 16 + (s[i] - 'A') + 10;
                else if(s[i]>='a' && s[i]<='f') t = t * 16 + (s[i] - 'a') + 10;
                else
                {   if(i==2) /* no number after \h */
                        *result = 'h';
                    else /* short number after \h */
                        *result = UNSIGNED(t);
                    i--;
                    ok = FALSE;
                }
            }
            if(ok) *result = UNSIGNED(t);
            break;
        case 'd':   /* decimal */
            while(i < 4 && ok)
            {   i++;
                if(s[i]>='0' && s[i]<='9') t = t * 10 + (s[i] - '0');
                else
                {   if(i==2) /* no number after \d */
                        *result = 'd';
                    else /* short number after \d */
                        *result = UNSIGNED(t);
                    i--;
                    ok = FALSE;
                }
            }
            if(ok) *result = UNSIGNED(t);
            break;
        default:    /* try octal interpretation */
            i--;
            while(i < 3 && ok)
            {   i++;
                if(s[i]>='0' && s[i]<='7') t = t * 8 + (s[i] - '0');
                else
                {   if(i==1) /* no number after \ */
                        *result = s[i];
                    else /* short number after \ */
                    {   *result = UNSIGNED(t);
                        i--;
                    }
                    ok = FALSE;
                }
            }
            if(ok) *result = UNSIGNED(t);
    }
    return i;
}

