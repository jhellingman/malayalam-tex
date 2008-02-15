#define VERSION "mm v1.1 MS-DOS (c) Jeroen Hellingman 16-NOV-1995\n"

/*
    mm -- convert malayalam text in transcription into input for TeX

USAGE:
    mm {-q|-v|-V|-h} [-t transfile][-s scriptfile] infile [outfile]
        -q quiet mode (default)
        -v verbose mode
        -V very verbose mode
        -h print help
        -t read transcription from transfile (default mm.trs)
        -s read script information from scriptfile (default mm.scr)

TODO:
  spurious characters appear in output when compiled with
  Borland C++ 4.5

HISTORY:
    04-MAY-1998 recompiled on MAC with CodeWarrior (JH)
    21-NOV-1995 changed some error messages (JH)
    16-NOV-1995 finally made it run again on MS-DOS (JH)
    29-NOV-1993 added (minimal) support for the Macintosh (JH)
    26-APR-1993 changed directory structure of source files (JH)
    25-DEC-1992 Move to version 1.0
                removed coded that placed reepham when Ra occurs
                initially (JH).
    24-DEC-1992 added support for environment variable. (JH)
                added -h option to print help. (JH)
                program will now add default file-suffixes if not given
                on command line. (JH)
                program will only `pun out' if very verbose option is given. (JH)
    08-OCT-1992 added support for at{end|begin}syllabe (JH)
    22-JUL-1992 removed bug causing endless loop outputting virama (JH)
    21-JUL-1992 added support for reepham (JH)
    28-JUN-1992 Genesis (Jeroen Hellingman)

*/

/*

    functional organisation

    main:
        command line arguments
        read tables

    start in normal mode
        switch mode when begin malayalam text is encountered

    convert mode:
        read letters from file
        build syllabes
        convert syllabes
        output result

*/

/***********************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#include "mm.h"
#include "trs.h"
#include "scr.h"
#include "readfile.h"

#define MAC      /* machine type, can be ATARI_ST, MS_DOS, UNIX, MAC */

#ifdef MAC
#include <console.h>
#endif

#ifdef MS_DOS
#include <dos.h>
unsigned _stklen = 0x2000;  /* added 16-NOV-1995 JH */
#endif

#ifndef TRUE
  #define TRUE    1
  #define FALSE   0
#endif

#if defined(ATARI_ST) || defined(MS_DOS)
#define DIRSEPARATOR_CHAR   '\\'
#define DIRSEPARATOR_STRING "\\"
#define MMDIR   "D:\\doc\\malyalam\\mmfont\\preproc\\" /* place where .trs and .scr are (overruled by env. var. MMDIR) */
#elif defined(UNIX)
#define DIRSEPARATOR_CHAR   '/'
#define DIRSEPARATOR_STRING "/"
#define MMDIR   "/bin"              /* place where .trs and .scr are (overruled by env. var. MMDIR) */
#elif defined(MAC)
#define DIRSEPARATOR_CHAR   ':'
#define DIRSEPARATOR_STRING ":"
#define MMDIR               ""
#endif

#define NUMPATS 10  /* number of pattern trees */
#define PATLEN  50  /* maximum length of pattern */
/* #define BUFSIZE 512 pushback buffer size (BUFSIZE >= PATLEN) */
#define SYLLABESIZE 20 /* maximum size of syllabe */

/* data types */

/***********************************************************************/

/* prototypes */

void defaultloop(void);
void malayalamloop(void);

void put_malayalam_letter(char);
void put_malayalam_syllabe(void);
void put_syllabe(char *s);
prebuild_char *find_cluster(char *s);
glyph_pair *find_ra(char **t);
glyph_pair *find_sec_cons(char *s, int r);
glyph_pair *find_vowel(char *s);
void use_virama(char *s, glyph_pair **primary_ra);

void processflags(int argc, char** argv);
static char *name_suffix(char* name, char *suffix);
static char *force_suffix(char* name, char *suffix);
void usage(void);
void help(void);
void copytexcommand(void);
void skiptexcommand(void);
void copycomment(void);
void skipcomment(void);
int readchar(void);
void unreadchar(int);
int what_escape(const char *s, char *result);
void inittables(void);

/***********************************************************************/

/* globals */

FILE *infile;
FILE *outfile;
char *progname = "mm";
char *insuffix = "mm";
char *outsuffix = "tex";
char *trssuffix = "trs";
char *scrsuffix = "scr";
char *trsfilename = "mmr.trs";      /* file containing transcription information */
char *scrfilename = "mmr.scr";      /* file containing script information */
char *infilename = NULL;
char *outfilename = NULL;
char *home = MMDIR;                 /* home directory (defined above) */
char *mmdir = "MMDIR";              /* name of env. var. for home directory */
int quiet = FALSE;                  /* don't be quiet */
int very_verbose = FALSE;
int verbose = FALSE;                /* don't be verbose */
static int debug = FALSE;           /* don't debug */
static int linenumber = 1;          /* current line in infile */

PSTree *normalp=NULL;                /* default patterns */
trs_table *trs=NULL;                /* patterns for transcription */
scr_table *scr = NULL;              /* script definition */

/* some extra globals */

typedef enum { ACCEPT, FLUSH } state;

char  syllabe[SYLLABESIZE];
int   syl_len = 0;
state syllabe_state = ACCEPT;

typedef enum
{   UNDEF,  VOWEL,  CONS,   VSIGN,  DIGIT,  OTHER,  VIRAM,
    BLANK,  JOIN,   NJOIN
} char_type_enum;

char_type_enum char_type[128] =
{   UNDEF, UNDEF, OTHER, OTHER, UNDEF, VOWEL, VOWEL, VOWEL,
    VOWEL, VOWEL, VOWEL, VOWEL, VOWEL, UNDEF, VOWEL, VOWEL,
    VOWEL, UNDEF, VOWEL, VOWEL, VOWEL, CONS,  CONS,  CONS,
    CONS,  CONS,  CONS,  CONS,  CONS,  CONS,  CONS,  CONS,
    CONS,  CONS,  CONS,  CONS,  CONS,  CONS,  CONS,  CONS,
    CONS,  UNDEF, CONS,  CONS,  CONS,  CONS,  CONS,  CONS,
    CONS,  CONS,  CONS,  CONS,  CONS,  CONS,  CONS,  CONS,
    CONS,  CONS,  UNDEF, UNDEF, UNDEF, UNDEF, VSIGN, VSIGN,
    VSIGN, VSIGN, VSIGN, VSIGN, VSIGN, UNDEF, VSIGN, VSIGN,
    VSIGN, UNDEF, VSIGN, VSIGN, VSIGN, VIRAM, UNDEF, UNDEF,
    UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, OTHER,
    UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF,
    VOWEL, VOWEL, UNDEF, UNDEF, UNDEF, UNDEF, DIGIT, DIGIT,
    DIGIT, DIGIT, DIGIT, DIGIT, DIGIT, DIGIT, DIGIT, DIGIT,
    UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF, UNDEF,
    UNDEF, UNDEF, UNDEF, UNDEF, BLANK, OTHER, NJOIN,  JOIN,
};

/***********************************************************************/

void PUSHBACK(char *c)
/* push the characters in string c back into the inputstream, works
 * with the pair of functions readchar() and unreadchar()
 */
{
	int i = (int)strlen(c)-1;
    for( ;i >= 0; i--) unreadchar((int)c[i]);
}

/***********************************************************************/

int main(int argc, char** argv)
/* check arguments, intialize tables, open files
 */
{
  char *tmp;
  tmp = getenv(mmdir);
  if(tmp != NULL) home = tmp;

#ifdef MAC
  argc = ccommand(&argv);
#endif

  processflags(argc, argv);
  if(verbose) fputs(VERSION, stderr);

  inittables();

  if(verbose) printf("reading from %s\n", infilename);
  infile = fopen(infilename, "r");
  if(infile==NULL)
  { fprintf(stderr, "%s: can't open %s\n", progname, infilename);
    exit(2);
  }
  if(verbose) printf("writing to %s\n", outfilename);
  outfile = fopen(outfilename, "w");
  if(outfile==NULL)
  { fprintf(stderr, "%s: can't create %s\n", progname, outfilename);
    exit(2);
  }
  defaultloop();
  fclose(infile);
  fclose(outfile);
  if(verbose) printf("done\n");
  exit(0);
  return 0;
}

void processflags(int argc, char** argv)
{ int nextoption = FALSE;
  int i = 1;

  if(argc < i+1) usage();
  if(argv[i][0] == '-') nextoption = TRUE;

  while(nextoption)
  { switch(argv[i][1])
    { case 'V':   very_verbose = TRUE; /* no break */
      case 'v':   verbose = TRUE;     break;
      case 'q':   quiet = TRUE;       break;
      case 'h':   help();
      case 'D':   debug = TRUE;       break;
      case 't':   trsfilename = name_suffix(argv[i+1], trssuffix); i++; break;
      case 's':   scrfilename = name_suffix(argv[i+1], scrsuffix); i++; break;
      default:    usage();
    }
    i++;
    if(argc < i+1) usage();
    if(argv[i][0] != '-') nextoption = FALSE;
  }
  infilename = name_suffix(argv[i], insuffix);
  if(argc < i+2)
  { outfilename = force_suffix(argv[i], outsuffix);
  }
  else
     outfilename = name_suffix(argv[i+1], outsuffix);
}

/* add suffix to name if none given */

static char *name_suffix(char* name, char *suffix)
{ long i, len = strlen(name);
  char *result;

  /* seek for dot, if found return name */
  for(i=0; i<len; i++) if(name[i] == '.') return name;
  /* otherwise add suffix */

  result = malloc(len+5);
  assert(result != NULL);
  strcpy(result, name);
  result[len] = '.';
  result[++len] = suffix[0];
  result[++len] = suffix[1];
  result[++len] = suffix[2];
  result[++len] = '\0';
  return result;
}

/* add suffix, remove orginal suffix if given */

static char *force_suffix(char* name, char *suffix)
{ long i, len = strlen(name);
  char *result;

  /* seek for dot, if found break */
  for(i=0; i<len; i++) if(name[i] == '.') break;

  result = malloc(len+5);
  assert(result != NULL);
  strcpy(result, name);
  result[i] = '.';
  result[++i] = suffix[0];
  result[++i] = suffix[1];
  result[++i] = suffix[2];
  result[++i] = '\0';
  return result;
}

/* place the home directory name in front of the file name */

char *prepend_home(char *filename)
{ long len1, len2;
  char *result;
  if(home == NULL) return filename;
  len1 = strlen(home);
  len2 = strlen(filename);
  result = malloc(len1+len2+2);
  assert(result != NULL);
  strcpy(result, home);
  if(home[len1-1] != DIRSEPARATOR_CHAR)     /* add backslash if not already there */
    strcat(result, DIRSEPARATOR_STRING);
  strcat(result, filename);
  return result;
}

void usage()
{ fprintf(stderr, "usage: %s {-q|-v|-V|-h} [-t transfile][-s scriptfile] infile [outfile]\n", progname);
  fprintf(stderr, "(%s -h will print a help message)\n", progname);
  exit(1);
}

void help()
{ char *s;
  puts(VERSION);
  printf("usage: %s {-q|-v|-V|-h} [-t transfile][-s scriptfile] infile [outfile]\n", progname);
  printf("\noptions:\n");
  printf("    -q quiet mode (default)\n");
  printf("    -v verbose mode\n");
  printf("    -V very verbose mode\n");
  printf("    -h print help\n");
  printf("    -t read transcription from transfile (default mmr.trs)\n");
  printf("    -s read script information from scriptfile (default mmr.scr)\n");
  printf("\ndefault file extensions:\n");
  printf("    transfile:   .trs\n");
  printf("    scriptfile:  .scr\n");
  printf("    infile:      .mm\n");
  printf("    outfile:     .tex\n");
  printf("\nthe environment variable %s tells %s where to look for transfile\nand scriptfile.\n", mmdir, progname);
  printf("    %s is currently ", mmdir);
  if((s=getenv(mmdir)) == NULL)
    printf("not set\n\n");
  else
     printf("set to %s\n\n", s);
  exit(0);
}

/***********************************************************************/

void inittables()
{ long len;
  char *act;
  string_list *next;

  trs = read_trs(trsfilename);
  scr = read_scr(scrfilename);

  /* insert trs->atend with action scr->atend in trs->p patterntree */
  len = strlen(scr->atend) + 1; act = malloc(len);
  if(act==NULL){fprintf(stderr, "can't allocate\n");exit(0);}
  act[0] = 'M';           /* action: switch to Malayalam script */
  act[1] = '\0';
  act = strcat(act, scr->atend);

  next = trs->atend;
  while(next != NULL && (next->s)!=NULL && next->s[0] != '\0')
  { PSTinsert(&(trs->p), next->s, act);
    next = next->n;
  }

  /* insert trs->atbegin in default patterntree */
  len = strlen(scr->atbegin) + 1; act = malloc(len);
  if(act==NULL){fprintf(stderr, "can't allocate\n");exit(0);}
  act[0] = 'M';           /* action: switch to default script */
  act[1] = '\0';
  act = strcat(act, scr->atbegin);

  next = trs->atbegin;
  while(next != NULL && (next->s)!=NULL && next->s[0] != '\0')
  { PSTinsert(&normalp, next->s, act);
    next = next->n;
  }
  /* also skip comment in default mode (HACK) */
  PSTinsert(&normalp, "%", "s");
  PSTinsert(&normalp, "\\%", "\\%");
  PSTinsert(&normalp, "$$", "p$$");
  /* code will change to add normal patterns from scr file */
}

/***********************************************************************/

void defaultloop()  /* almost same as normal patc */
{ char ps[PATLEN+1];      /* pattern to be search for */
  char *action;           /* action with pattern */
  int len = PATLEN;       /* length of found pattern; part of ps to be read */
  int i, j;               /* counters */

  while(TRUE)
  { /* fill pattern */
    for(i = 0, j = len; j < PATLEN; i++, j++) ps[i] = ps[j];
    for(i = PATLEN - len; i < PATLEN; i++)
    { int c = readchar();
      ps[i] = (c == EOF) ? '\0' : (char)c;
    }
    ps[PATLEN] = '\0'; /* NULL-terminate */
    if(ps[0] == '\0') break;

    /* find action */

    action = PSTmatch(normalp, ps, &len);

    if(len == 0) /* no match, copy first letter silently */
    { fputc(ps[0], outfile);
      len = 1;
    }
    else /* do action */
    { switch(action[0])
      { case 'p':   fputs(&action[1], outfile);         break;
        case 'c':   PUSHBACK(ps); len = PATLEN; copycomment();      break;
        case 't':   PUSHBACK(ps); len = PATLEN; copytexcommand();       break;
        case 'T':   PUSHBACK(ps); len = PATLEN; skiptexcommand();       break;
        case 's':   PUSHBACK(ps); len = PATLEN; skipcomment();      break;
        case 'f':   /* forget */                        break;
        case 'e':   fprintf(stderr, "Error: %s near line %d\n", &action[1], linenumber);
                    break;
        case 'M':   fputs(&action[1], outfile); /* output @atbegin text */
                    PUSHBACK(&ps[len]); len = PATLEN; /* pushback rest */
                    malayalamloop();
                    break;
        default:    fprintf(stderr, "Internal error: unknown action\n");
                    exit(10);
      } /* switch */
    } /* else */
  } /* while */
} /* defaultloop() */

/***********************************************************************/

void malayalamloop()    /* build syllabes loop */
{ char ps[PATLEN+1];      /* pattern to be search for */
  char *action;           /* action with pattern */
  int len = PATLEN;       /* length of found pattern; part of ps to be read */
  int i, j;               /* counters */

  while(TRUE)
  { /* fill pattern */
    for(i = 0, j = len; j < PATLEN; i++, j++) ps[i] = ps[j];
    for(i = PATLEN - len; i < PATLEN; i++)
    { int c = readchar();
      ps[i] = (c == EOF) ? '\0' : (char)c;
    }
    ps[PATLEN] = '\0'; /* NULL-terminate */
    if(ps[0] == '\0') break;

    /* find action */

    action = PSTmatch(trs->p, ps, &len);

    if(len == 0) /* no match, complain */
    { fprintf(stderr, "Error: illegal character '%c' near line %d\n", ps[0], linenumber);
      len = 1;
    }
    else /* do action */
    { switch(action[0])
      { case 'p':   put_malayalam_syllabe();
                    fputs(&action[1], outfile);         break;
        case 'c':   put_malayalam_syllabe();
                    PUSHBACK(ps); len = PATLEN; copycomment();      break;
        case 't':   put_malayalam_syllabe();
                    PUSHBACK(ps); len = PATLEN; copytexcommand();       break;
        case 'T':   put_malayalam_syllabe();
                    PUSHBACK(ps); len = PATLEN; skiptexcommand();       break;
        case 's':   put_malayalam_syllabe();
                    PUSHBACK(ps); len = PATLEN; skipcomment();      break;
        case 'f':   /* forget */                        break;
        case 'e':   put_malayalam_syllabe();
                    fprintf(stderr, "Error: %s near line %d\n", &action[1], linenumber);
                    break;
        case 'M':   put_malayalam_syllabe();    /* output last syllabe */
                    fputs(&action[1], outfile); /* output @atend text */
                    PUSHBACK(&ps[len]); len = PATLEN; /* pushback rest */
                     return; /* go back to main loop */
        case '=':   /* we have a letter, now we have to decide what to do with it
                       we have reached the end of a syllabe or not */
                    put_malayalam_letter(action[1]); /* add letter to current syllabe */
                    break;
        default:    fprintf(stderr, "Internal error: unknown action\n");
                    exit(10);
      } /* switch */
    } /* else */
  } /* while */
}

/***********************************************************************/

void put_malayalam_letter(char c) /* accept a letter, and output a syllabe if neccessary */
{ if(debug)fprintf(stdout, "put malayalam letter %X\n", (int)c);

  if(char_type[c] == UNDEF)
  { fprintf(stderr, "%s: undefined Malayalam char %X near line %i\n", progname, (int)c, linenumber);
    return;
  }

  switch(syllabe_state)
  { case ACCEPT:
         switch(char_type[c])
            {   case CONS:
                case JOIN:
                    syllabe[syl_len++] = c;
                    break;
                case BLANK:
                    put_malayalam_syllabe();
                    /* fall through */
                default:
                    syllabe[syl_len++] = c;
                    syllabe_state = FLUSH;
            }
            break;
        case FLUSH:
            switch(char_type[c])
            {   case JOIN:
                    syllabe[syl_len++] = c;
                    syllabe_state = ACCEPT;
                    break;
                case CONS:
                    put_malayalam_syllabe();
                    syllabe[syl_len++] = c;
                    syllabe_state = ACCEPT;
                    break;
                default:
                    put_malayalam_syllabe();
                    syllabe[syl_len++] = c;
                    break;
            }
    }
    syllabe[syl_len] = '\0';
    if(syl_len >= SYLLABESIZE-2)
        put_malayalam_syllabe();
}

static int cmp_glyph_pair(void *a, void *b)
{ return strcmp(((glyph_pair*)a)->c, ((glyph_pair*)b)->c);
}

static int cmp_prebuild_char(void *a, void *b)
{ return strcmp(((prebuild_char*)a)->c, ((prebuild_char*)b)->c);
}

void put_malayalam_syllabe()    /* output a syllabe */
{ int is_syllabe = FALSE;

  if(debug)fprintf(stdout, "syllabe\n");
  if(syl_len == 0) return;

  /* add VIRAMA if last sign is consonant */
  if(char_type[syllabe[syl_len-1]] == CONS)
  { syllabe[syl_len++] = VIRAMA;
    syllabe[syl_len] = '\0';
  }

  if(char_type[syllabe[0]] == CONS ||
     char_type[syllabe[0]] == VOWEL) is_syllabe = TRUE;

  if(is_syllabe) fputs(scr->atbeginsyllabe, outfile);

  put_syllabe(syllabe);

  if(is_syllabe) fputs(scr->atendsyllabe, outfile);

  syllabe[0]='\0'; syl_len=0;
  return;
}

prebuild_char *is_prebuild(char *s)
{
  prebuild_char tmp; tmp.c = s;
  return AVLfind(&tmp, scr->prebuild, cmp_prebuild_char);
}

glyph_pair *is_primary(char *s)
{
  glyph_pair tmp; tmp.c = s;
  return AVLfind(&tmp, scr->primary, cmp_glyph_pair);
}

glyph_pair *is_secondary(char *s)
{
  glyph_pair tmp; tmp.c = s;
  return AVLfind(&tmp, scr->secondary, cmp_glyph_pair);
}

void pun_out(char c)
{
  static column = 0;
  column++;
  if(column == 78) { putchar('\n'); column = 1; }
  putchar(c);
}

void put_syllabe(char *s)
{ 
  glyph_pair        *primary_ra = NULL;
  glyph_pair        *vowel = NULL;               /* also used for virama */
  glyph_pair        *sec_cons = NULL;
  prebuild_char     *cluster = NULL;

  if(very_verbose) pun_out('.'); /* signal it */

  if((cluster = is_prebuild(s)) == NULL)
  { primary_ra = find_ra(&s);
    if((cluster = is_prebuild(s)) == NULL)
    {   if((sec_cons = find_sec_cons(s, 1)) == NULL)
        { vowel = find_vowel(s);
          if((cluster = is_prebuild(s)) != NULL)
            s[0] = '\0';
          else
            sec_cons = find_sec_cons(s, 0);
      }
        if(cluster == NULL)
          cluster = find_cluster(s);
        if(strlen(s) > 0) use_virama(s, &primary_ra);
    }
  }
  /* output the syllabe */

  if(!scr->reepham && primary_ra != NULL) fputs(primary_ra->b, outfile);
  if(vowel != NULL) fputs(vowel->b, outfile);
  if(sec_cons != NULL) fputs(sec_cons->b, outfile);
  if(scr->reepham && primary_ra != NULL) fputs(primary_ra->b, outfile);
  if(cluster != NULL) fputs(cluster->g, outfile);
  if(scr->reepham && primary_ra != NULL) fputs(primary_ra->a, outfile);
  if(sec_cons != NULL) fputs(sec_cons->a, outfile);
  if(vowel != NULL) fputs(vowel->a, outfile);
  if(!scr->reepham && primary_ra != NULL) fputs(primary_ra->a, outfile);
}

glyph_pair *find_ra(char **t)
{ 
  char *s = *t;
  char ra_string[] = { LETTER_RA, '\0' };
  glyph_pair *result = NULL;

  /* do we have primary ra? */
  if(s[0] == LETTER_RA && char_type[s[1]] == CONS)
  { if((result = is_primary(ra_string)) == NULL)
        fprintf(stderr, "need glyph(s) for primary ra\n");
     s = &s[1];
  }
  *t = s;
  return result;
}

glyph_pair *find_sec_cons(char *s, int r)
{ glyph_pair *result = NULL;
  long i;
  long len=strlen(s)-r;

  for(i=1;i<len;i++)
  { if((result = is_secondary(&s[i])) != NULL)
     {  s[i] = '\0';
        break;
     }
  }
  return result;
}

glyph_pair *find_vowel(char *s)
{ long i = strlen(s)-1;
  glyph_pair *result;

  if((result = is_secondary(&s[i])) == NULL)
    fprintf(stderr, "need glyph(s) for secondary vowel/virama %d (0x%02X)\n", (int)s[i], (int)s[i]);
  s[i] = '\0';
  return result;
}

prebuild_char *find_cluster(char *s)
{ long i, len = strlen(s);
  prebuild_char *result;
  for(i = 0;i<len;i++)
  { if((result = is_prebuild(&s[i])) != NULL)
     {  s[i] = '\0'; /* that is done now */
        break;
     }
  }
  if(result == NULL)
  { fprintf(stderr, "need glyph(s) for single character %d (0x%02X)\n", (int)s[len-1], (int)s[len-1]);
     s[len-1] = '\0';
  }
  return result;
}

void use_virama(char *s, glyph_pair **primary_ra)
{ long i;
  long len = strlen(s);
  prebuild_char *cluster = NULL;
  glyph_pair *virama = NULL;
  char virama_string[] = { VIRAMA, '\0' };

  if(very_verbose) pun_out('+');

  for(i=0;i<len;i++)
  { s[len] = VIRAMA; s[len+1] = '\0';
     if((cluster = is_prebuild(&s[i])) != NULL)
     {  s[i] = '\0';
        break;
     }
     else
     {  s[len] = '\0';
        if((cluster = is_prebuild(&s[i])) != NULL)
      { s[i] = '\0';
          if((virama = is_secondary(virama_string)) == NULL)
          fprintf(stderr, "need glyph(s) for secondary virama\n");
          break;
      }
    }
  }
  if(strlen(s) > 0) use_virama(s, primary_ra);

  /* output what we have now */
  if(*primary_ra != NULL) fputs((*primary_ra)->b, outfile);
  if(virama != NULL) fputs(virama->b, outfile);
  if(cluster != NULL) fputs(cluster->g, outfile);
  if(virama != NULL) fputs(virama->a, outfile);
  if(*primary_ra != NULL)
  { fputs((*primary_ra)->a, outfile);
    *primary_ra = NULL;
  }
}

/***********************************************************************/

void copytexcommand()
/* copy TeX commmand, including preceding \
 * this will work in plain TeX and LaTeX
 */
{ int c = readchar();
  if(c=='\\')
  { fputc(c, outfile);
    c = readchar();
    if(isalpha(c))
    { while(isalpha(c))
      { fputc(c, outfile);
        c = readchar();
      }
      unreadchar(c);
    }
    else
      fputc(c, outfile);
  }
  else
    unreadchar(c);
}

void skiptexcommand()
/* skip TeX commmand, including preceding \
 * this will work in plain TeX and LaTeX
 */
{ int c = readchar();
  if(c=='\\')
  { c = readchar();
    if(isalpha(c))
    { while(isalpha(c))
      { c = readchar();
      }
      unreadchar(c);
    }
  }
  else
    unreadchar(c);
}

void copycomment()
{   int c = readchar();
    if(c=='%')
    {   while(c != '\n' && c != EOF)
        {   fputc(c, outfile);
            c = readchar();
        }
        fputc('\n', outfile);
    }
    else
        unreadchar(c);
}

void skipcomment()
{   int c = readchar();
    if(c=='%')
    {   while(c != '\n' && c != EOF)
            c = readchar();
    }
    else
        unreadchar(c);
}

/***********************************************************************/
/* file access with buffer */

static int fbuffer[BUFSIZE];        /* buffer for file operations */
static int last = 0;                /* last + 1 used in fbuffer */

int readchar()
{   int result;

    if(last==0) /* nothing in buffer */
        result = fgetc(infile);
    else /* get first from buffer */
    {   last--;
        result = fbuffer[last];
    }
    if(result == '\n') linenumber++;
    return result;
}

void unreadchar(int c)
{
    if(last == BUFSIZE)
    {   fprintf(stderr, "%s: push-back file buffer full\n", progname);
        exit(1);
    }
    else /* voeg na last in buffer */
    {   fbuffer[last] = c;
        last++;
        if(c == '\n') linenumber--;
    }
}

/* end of mm.c */
