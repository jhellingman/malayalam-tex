// readfile.h

#ifndef READFILE_HEADER_READ
#define READFILE_HEADER_READ

#ifndef TRUE
  #define TRUE 1
  #define FALSE 0
#endif

#define BUFSIZE 1024
#define COMMANDCHAR '@'
#define COMMENTCHAR '%'

typedef struct string_list
{   char                *s;
    struct string_list  *n;
} string_list;

/* public operations */

string_list *get_line(FILE *f);
char *get_command(FILE *f, char *command, string_list **rest);

#endif
/* eof */
