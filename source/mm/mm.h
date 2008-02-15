// mm.h

#ifndef TRUE
  #define TRUE 1
  #define FALSE 0
#endif

char *prepend_home(char *filename);

/* table of malayalam letters */

#define SIGN_ANUSVARA       2
#define SIGN_VISARGA        3

#define LETTER_A            5
#define LETTER_AA           6
#define LETTER_I            7
#define LETTER_II           8
#define LETTER_U            9
#define LETTER_UU           10
#define LETTER_VOCALIC_R    11
#define LETTER_VOCALIC_L    12

#define LETTER_E            14
#define LETTER_EE           15
#define LETTER_AI           16

#define LETTER_O            18
#define LETTER_OO           19
#define LETTER_AU           20

#define LETTER_KA           21
#define LETTER_KHA          22
#define LETTER_GA           23
#define LETTER_GHA          24
#define LETTER_NGA          25
#define LETTER_CA           26
#define LETTER_CHA          27
#define LETTER_JA           28
#define LETTER_JHA          29
#define LETTER_NYA          30
#define LETTER_TTA          31
#define LETTER_TTHA         32
#define LETTER_DDA          33
#define LETTER_DDHA         34
#define LETTER_NNA          35
#define LETTER_TA           36
#define LETTER_THA          37
#define LETTER_DA           38
#define LETTER_DHA          39
#define LETTER_NA           40

#define LETTER_PA           42
#define LETTER_PHA          43
#define LETTER_BA           44
#define LETTER_BHA          45
#define LETTER_MA           46
#define LETTER_YA           47
#define LETTER_RA           48
#define LETTER_RRA          49
#define LETTER_LA           50
#define LETTER_LLA          51
#define LETTER_LLLA         52
#define LETTER_VA           53
#define LETTER_SHA          54
#define LETTER_SSA          55
#define LETTER_SA           56
#define LETTER_HA           57

#define VOWEL_SIGN_AA       62
#define VOWEL_SIGN_I        63
#define VOWEL_SIGN_II       64
#define VOWEL_SIGN_U        65
#define VOWEL_SIGN_UU       66
#define VOWEL_SIGN_VOCALIC_R    67
#define VOWEL_SIGN_VOCALIC_RR   68

#define VOWEL_SIGN_E        70
#define VOWEL_SIGN_EE       71
#define VOWEL_SIGN_AI       72

#define VOWEL_SIGN_O        74
#define VOWEL_SIGN_OO       75
#define VOWEL_SIGN_AU       76

#define VIRAMA              77

#define AU_LENGTH_MARK      87

#define LETTER_VOCALIC_RR   96
#define LETTER_VOCALIC_LL   97

#define DIGIT_ZERO          102
#define DIGIT_ONE           103
#define DIGIT_TWO           104
#define DIGIT_THREE         105
#define DIGIT_FOUR          106
#define DIGIT_FIVE          107
#define DIGIT_SIX           108
#define DIGIT_SEVEN         109
#define DIGIT_EIGHT         110
#define DIGIT_NINE          111

/* extra's not on this place in unicode */

#define JOINER              127
#define NON_JOIN            126
#define DOTTED_CIRCLE       125
#define SPACE               124

/* eof */


