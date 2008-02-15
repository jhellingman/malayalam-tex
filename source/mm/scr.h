
#ifndef SCR_HEADER_READ
#define SCR_HEADER_READ

#include "avltree.h"
#include "readfile.h"

#define MALAYALAM_SCRIPT    13

typedef struct
{   int         script_type;
    AVLtree     *prebuild;          /* AVLtree of prebuild_chars, defining pre-build syllabes */
    AVLtree     *primary;           /* AVLtree of glyph_pairs, defining front and final part of primary variants */
    AVLtree     *secondary;         /* AVLtree of glyph_pairs, defining front and final part of secondary variants */
    char        *atbegin;
    char        *atend;
    char        *atbeginsyllabe;
    char        *atendsyllabe;
    int         reepham;            /* boolean: do we use the reepham? */
} scr_table;

typedef struct
{   char    *c;         /* char codes */
    char    *g;         /* glyphs */
} prebuild_char;

typedef struct
{   char    *c;         /* char codes */
    char    *b;         /* glyphs to place before syllabe in construction */
    char    *a;         /* glyphs to place after syllabe in construction */
} glyph_pair;

/* public functions */

scr_table *read_scr(char *filename);

#endif

/* eof */
