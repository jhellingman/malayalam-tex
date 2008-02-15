
#ifndef TRS_HEADER_READ
#define TRS_HEADER_READ

#include "pstree.h"
#include "readfile.h"

typedef struct
{   PSTree      *p;
    string_list *atbegin;
    string_list *atend;
} trs_table;

/* public operations */

trs_table *read_trs(char *filename);

#endif
