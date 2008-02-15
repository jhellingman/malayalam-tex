% dng.pat -- Convert my transcription to Velthuis' transcription
% Copyright 1993, 1995 Jeroen Hellingman
%
% History:
%   05-MAY-1998 Minor modifications
%   23-NOV-1995 adopted to new transcription scheme
%
%
% alphabet:
%   OM a/* aa i ii u uu R R L LL e .e ai o .o au .a
%
%   a/ a.m a.h
%
%   ka kha ga gha "n        qa .kha .ga
%   ca cha ja jha ~n        za
%   .ta .tha .da .dha .na   .ra .rha
%   ta tha da dha na
%   pa pha ba bha ma        fa
%   ya ra la va             "r
%   sha .sa sa ha .la
%
%   0 1 2 3 4 5 6 7 8 9
%
%   ` `` '' '  ! ?  . , : ; | ( )
%
%   + = @ # ^ ^^ >
%
% author:
%   Jeroen Hellingman
%   Aletta Jacobsstraat 5, 3404 XD IJsselstein, The Netherlands

@patterns 0 patterns for normal ASCII
"$"             1 "{\\dn "      begin devanagari
"<hindi>"       1 "{\\dn "
"<marathi>"     1 "{\\dn "
"<nepali>"      1 "{\\dn "
"<sanskrit>"    1 "{\\dn "
"$$"            2 "{\\dntr "    begin devanagari in transcription
"<hindi.transcription>"     1 "{\\dn "
"<marathi.transcription>"   1 "{\\dn "
"<nepali.transcription>"    1 "{\\dn "
"<sanskrit.transcription>"  1 "{\\dn "
"%"         c               skip comments
"\\"        t               skip TeX-command.
"\t"        p " "           tab -> space (for devnag)

@rpatterns 1 patterns my transcription -> devnag transcription

"$"             0 "}"
"</hindi>"      0 "}"
"</marathi>"    0 "}"
"</nepali>"     0 "}"
"</sanskrit>"   0 "}"
"$$"            e "$$ while in $-mode"
"%"             c
"\\"            t

"a"         p "a"
"*"         p "a"               silent a ($kar*naa$ = to work)
"aa"        p "A"
"i"         p "i"
"ii"        p "I"
"u"         p "u"
"uu"        p "U"
"R"         p ".r"
"RR"        p ".R"
"L"         p ".l"
"LL"        p ".L"
"e"         p "e"
"ai"        p "E"
"o"         p "o"
"au"        p "O"

"k"         p "k"
"kh"        p "K"
"g"         p "g"
"gh"        p "G"
"\"n"       p "\"n"
"q"         p "q"
".kh"       p ".K"
".g"        p ".g"

"c"         p "c"
"ch"        p "C"
"j"         p "j"
"jh"        p "J"
"~n"        p "~n"
"z"         p "z"

".t"        p ".t"
".th"       p ".T"
".d"        p ".d"
".dh"       p ".D"
".n"        p ".n"
".r"        p "R"
".rh"       p "Rh"

"t"         p "t"
"th"        p "T"
"d"         p "d"
"dh"        p "D"
"n"         p "n"
"p"         p "p"
"ph"        p "P"
"b"         p "b"
"bh"        p "B"
"m"         p "m"
"f"         p "f"

"y"         p "y"
"r"         p "r"
"l"         p "l"
"v"         p "v"
"sh"        p "\"s"
".s"        p ".s"
"s"         p "s"
"h"         p "h"
".l"        p "L"               Marathi l
"\"r"       p "~r"              Marathi r

".a"        p ".a"              ahagraha
"OM"        p ".o"              O...M
".e"        p "~a"              English a (Marathi)
".o"        p "~o"              English o
".m"        p "M"               anusvara
"/"         p "/"               candrabindu: gets a special treatment
".h"        p ".h"              visarga
"|"         p "|"               dand
"@"         p "@"               abbreviation circle
"."         p ".."              period
"#"         p "#"               centered period
"+"         p "&"               viram
"="         p "&"       viram
"^"         p ""                ^ and ^^ dissappear in devanaagarii
"<"         p ""                dissappears by definition
">"         p ""                dissappears
"{"         p "{"               TeX-braces
"}"         p "}"
"\n"        p "\n"
","         p ","
":"         p ":"
";"         p ";"
"-"         p "-"
"["         p "["
"]"         p "]"
"("         p "("
")"         p ")"
"?"         p "?"
"!"         p "!"
"`"         p "`"
"'"         p "'"
"0"         p "0"
"1"         p "1"
"2"         p "2"
"3"         p "3"
"4"         p "4"
"5"         p "5"
"6"         p "6"
"7"         p "7"
"8"         p "8"
"9"         p "9"
" "         p " "
"\t"        p " "           tab -> space

% no candrabindu if matra above headline (does not function correctly with reph)

"i/"        p "iM"
"ii/"       p "IM"
"e/"        p "eM"
"ai/"       p "EM"
"o/"        p "oM"
"au/"       p "OM"
" e/"       p " e/"         but remain candrabindu on front e
"\ne/"      p "\ne/"        idem
"\te/"      p " e/"         idem
"-e/"       p "-e/"         idem
"ae/"       p "ae/"
"aae/"      p "Ae/"
"ie/"       p "ie/"
"iie/"      p "Ie/"
"ue/"       p "ue/"
"uue/"      p "Ue/"
"aie/"      p "Ee/"
"oe/"       p "oe/"
"aue/"      p "Oe/"

@rpatterns 2 patterns my transcription -> transcription in TeX

"$"             e "$ while in $$-mode"
"$$"            0 "}"
"</hindi>"      0 "}"
"</marathi>"    0 "}"
"</nepali>"     0 "}"
"</sanskrit>"   0 "}"
"^^"            3 ""            Go to capital-mode
"%"             c
"\\"            t
"\t"            p " "           tab -> spacie
"^"             e "^ in front of non-letter"

"a"         p "a"
"*"         p ""            silent a ($kar*naa$ = to work)
"aa"        p "\\=a"
"i"         p "i"
"ii"        p "{\\=\\i}"
"u"         p "u"
"uu"        p "\\=u"
"R"         p "\\d r"
"RR"        p "{\\rii}"     TeX macro \rii
"L"         p "\\d l"
"LL"        p "{\\lii}"     TeX macros \lii
"e"         p "e"
"ai"        p "ai"
"o"         p "o"
"au"        p "au"

"k"         p "k"
"kh"        p "kh"
"g"         p "g"
"gh"        p "gh"
"\"n"       p "\\.n"
"q"         p "q"
".kh"       p "{\\kh}"      Tex macro \kh
".g"        p "{\\g}"       Tex macro \g

"c"         p "c"
"ch"        p "ch"
"j"         p "j"
"jh"        p "jh"
"~n"        p "\\~n"
"z"         p "z"

".t"        p "\\d t"
".th"       p "\\d th"
".d"        p "\\d d"
".dh"       p "\\d dh"
".n"        p "\\d n"
".r"        p "\\d r"
".rh"       p "\\d rh"

"t"         p "t"
"th"        p "th"
"d"         p "d"
"dh"        p "dh"
"n"         p "n"
"p"         p "p"
"ph"        p "ph"
"b"         p "b"
"bh"        p "bh"
"m"         p "m"
"f"         p "f"

"y"         p "y"
"r"         p "r"
"l"         p "l"
"v"         p "v"
"sh"        p "\\'s"
".s"        p "\\d s"
"s"         p "s"
"h"         p "h"
".l"        p "\\d l"       Marathi l
"\"r"       p "r"           Marathi eyelash r
".a"        p "a"           ahagraha
"OM"        p "O\\dots M"   O...M
".e"        p "\\^e"       English a (Marathi)
".o"        p "\\^o"       English o
".m"        p "\\d m"       anusvara: see below
"/"         p "\\.m"        candrabindu: treated specially
".h"        p "\\d h"       visarga
"|"         p "."           danda
" |"        p "."           eat space before dand
"||"        p "."           dubble dand
"@"         p "."           abbreviation
"."         p "."           period
"###"       p "{\\dots}"
"#"         p "."           centered period
"+"         p ""            halant
"="     p ""        soft halant
"<"         p ""            stop ambiguity; dissappears by definition
">"         p " "           becomes space
"{"         p "{"           TeX-braces
"}"         p "}"
"\n"        p "\n"
","         p ","
":"         p ":"
";"         p ";"
"-"         p "-"
"["         p "["
"]"         p "]"
"("         p "("
")"         p ")"
"?"         p "?"
"!"         p "!"
"`"         p "`"
"'"         p "'"
"0"         p "0"
"1"         p "1"
"2"         p "2"
"3"         p "3"
"4"         p "4"
"5"         p "5"
"6"         p "6"
"7"         p "7"
"8"         p "8"
"9"         p "9"
" "         p " "

% repeat partial table for correct transcription of anusvar

".mk"       p "\\.nk"
".mkh"      p "\\.nkh"
".mg"       p "\\.ng"
".mgh"      p "\\.ngh"
".mq"       p "\\.nq"
".m.kh"     p "\\.n{\\kh}"
".m.g"      p "\\.n{\\g}"
".mh"       p "\\.nh"

".mc"       p "\\~nc"
".mch"      p "\\~nch"
".mj"       p "\\~nj"
".mjh"      p "\\~njh"
".msh"      p "\\~n\\'s"
".my"       p "\\~ny"

".m.t"      p "\\d n\\d t"
".m.th"     p "\\d n\\d th"
".m.d"      p "\\d n\\d d"
".m.dh"     p "\\d n\\d dh"
".m.s"      p "\\d n\\d s"
".mr"       p "\\d nr"

".mt"       p "nt"
".mth"      p "nth"
".md"       p "nd"
".mdh"      p "ndh"
".ms"       p "ns"
".ml"       p "nl"

".mp"       p "mp"
".mph"      p "mph"
".mb"       p "mb"
".mbh"      p "mbh"
".mf"       p "mf"

% part for correct translation candrabindu

"a/"        p "\\~a"
"aa/"       p "\\ltwig{a}"
"i/"        p "{\\~\\i}"
"ii/"       p "\\ltwig{\\i}"
"u/"        p "\\~u"
"uu/"       p "\\ltwig{u}"
"e/"        p "\\~e"
"ai/"       p "a{\\~\\i}"
"o/"        p "\\~o"
"au/"       p "a\\~u"

% part for capitals

"^a"        p "A"
"^aa"       p "\\=A"
"^i"        p "I"
"^ii"       p "\\=I"
"^u"        p "U"
"^uu"       p "\\=U"
"^R"        p "\\d R"
"^RR"       p "{\\Rii}"     TeX macro \Rii
"^L"        p "\\d L"
"^LL"       p "{\\Lii}"     TeX macro \Lii
"^e"        p "E"
"^ai"       p "Ai"
"^o"        p "O"
"^au"       p "Au"

"^k"        p "K"
"^kh"       p "Kh"
"^g"        p "G"
"^gh"       p "Gh"
"^\"n"      p "\\.N"
"^q"        p "Q"
"^.kh"      p "{\\Kh}"      Tex macro \Kh
"^.g"       p "{\\G}"       Tex macro \G

"^c"        p "C"
"^ch"       p "Ch"
"^j"        p "J"
"^jh"       p "Jh"
"^~n"       p "\\~N"
"^z"        p "Z"

"^.t"       p "\\d T"
"^.th"      p "\\d Th"
"^.d"       p "\\d D"
"^.dh"      p "\\d Dh"
"^.n"       p "\\d N"
"^.r"       p "\\d R"
"^.rh"      p "\\d Rh"

"^t"        p "T"
"^th"       p "Th"
"^d"        p "D"
"^dh"       p "Dh"
"^n"        p "N"
"^p"        p "P"
"^ph"       p "Ph"
"^b"        p "B"
"^bh"       p "Bh"
"^m"        p "M"
"^f"        p "F"

"^y"        p "Y"
"^r"        p "R"
"^l"        p "L"
"^v"        p "V"
"^sh"       p "\\'S"
"^.s"       p "\\d S"
"^s"        p "S"
"^h"        p "H"
"^.l"       p "\\d L"       Marathi l
"^\"r"      p "R"           Marathi eyelash r
"^.a"       p "A"           ahagraha
"^.e"       p "\\^E"        English a (Marathi)
"^.o"       p "\\^O"        English o

% part for correct translation candrabindu

"^a/"       p "\\~A"
"^aa/"      p "\\ltwig{A}"
"^i/"       p "{\\~\\i}"
"^ii/"      p "\\ltwig{I}"
"^u/"       p "\\~U"
"^uu/"      p "\\ltwig{U}"
"^e/"       p "\\~E"
"^ai/"      p "A{\\~\\i}"
"^o/"       p "\\~O"
"^au/"      p "A\\~u"

@rpatterns 3 patterns my transcription -> transcription in TeX (capitals)

"$"             e "$ while in $$-mode"
"$$"            0 "}"
"</hindi>"      0 "}"
"</marathi>"    0 "}"
"</nepali>"     0 "}"
"</sanskrit>"   0 "}"
"^^"            2 ""            Go to small-letter-mode
"%"             c
"\\"            t
"^"             p ""            forget this one now

"a"         p "A"
"*"         p ""            silent a ($kar*naa$ = to work)
"aa"        p "\\=A"
"i"         p "I"
"ii"        p "\\=I"
"u"         p "U"
"uu"        p "\\=U"
"R"         p "\\d R"
"RR"        p "{\\Rii}"     TeX macro \Rii
"L"         p "\\d L"
"LL"        p "{\\Lii}"     TeX macro \Lii
"e"         p "E"
"ai"        p "AI"
"o"         p "O"
"au"        p "AU"

"k"         p "K"
"kh"        p "KH"
"g"         p "G"
"gh"        p "GH"
"\"n"       p "\\.N"
"q"         p "Q"
".kh"       p "{\\KH}"      Tex macro \KH
".g"        p "{\\G}"       Tex macro \G

"c"         p "C"
"ch"        p "CH"
"j"         p "J"
"jh"        p "JH"
"~n"        p "\\~N"
"z"         p "Z"

".t"        p "\\d T"
".th"       p "\\d TH"
".d"        p "\\d D"
".dh"       p "\\d DH"
".n"        p "\\d N"
".r"        p "\\d R"
".rh"       p "\\d RH"

"t"         p "T"
"th"        p "TH"
"d"         p "D"
"dh"        p "DH"
"n"         p "N"
"p"         p "P"
"ph"        p "PH"
"b"         p "B"
"bh"        p "BH"
"m"         p "M"
"f"         p "F"

"y"         p "Y"
"r"         p "R"
"l"         p "L"
"v"         p "V"
"sh"        p "\\'S"
".s"        p "\\d S"
"s"         p "S"
"h"         p "H"
".l"        p "\\d L"       Marathi l
"\"r"       p "R"           Marathi eyelash r

".a"        p "A"           ahagraha
"OM"        p "O\\dots M"   O...M
".e"        p "\\^E"       English a (Marathi)
".o"        p "\\^O"       English o
".m"        p "\\d M"       anusvara: see below
"/"         p "\\.M"        candrabindu: treated specially
".h"        p "\\d H"       visarga

"|"         p "."           dand
" |"        p "."           eat space in front of dand
"||"        p "."           dubble dand
"@"         p "."           abbreviation
"."         p "."           period
"###"       p "{\\dots}"
"#"         p "."           centered period
"+"         p ""            halant
"="         p ""            soft halant
"<"         p ""            remove ambiguity; dessapears by definition
">"         p " "           becomes space
"{"         p "{"           TeX-braces
"}"         p "}"
"\n"        p "\n"
","         p ","
":"         p ":"
";"         p ";"
"-"         p "-"
"["         p "["
"]"         p "]"
"("         p "("
")"         p ")"
"?"         p "?"
"!"         p "!"
"`"         p "`"
"'"         p "'"
"0"         p "0"
"1"         p "1"
"2"         p "2"
"3"         p "3"
"4"         p "4"
"5"         p "5"
"6"         p "6"
"7"         p "7"
"8"         p "8"
"9"         p "9"
" "         p " "

% repeat part for correct transcription anusvara

".mk"       p "\\.NK"
".mkh"      p "\\.NKH"
".mg"       p "\\.NG"
".mgh"      p "\\.NGH"
".mq"       p "\\.NQ"
".m.kh"     p "\\.N{\\KH}"
".m.g"      p "\\.N{\\G}"
".mh"       p "\\.NH"

".mc"       p "\\~NC"
".mch"      p "\\~NCH"
".mj"       p "\\~NJ"
".mjh"      p "\\~NJH"
".msh"      p "\\~N\\'S"
".my"       p "\\~NY"

".m.t"      p "\\d N\\d T"
".m.th"     p "\\d N\\d TH"
".m.d"      p "\\d N\\d D"
".m.dh"     p "\\d N\\d DH"
".m.s"      p "\\d N\\d S"
".mr"       p "\\d NR"

".mt"       p "NT"
".mth"      p "NTH"
".md"       p "ND"
".mdh"      p "NDH"
".ms"       p "NS"
".ml"       p "NL"

".mp"       p "MP"
".mph"      p "MPH"
".mb"       p "MB"
".mbh"      p "MBH"
".mf"       p "MF"

% part for correct translation candrabindu

"a/"        p "\\~A"
"aa/"       p "\\ltwig{A}"
"i/"        p "\\~I"
"ii/"       p "\\ltwig{I}"
"u/"        p "\\~U"
"uu/"       p "\\ltwig{U}"
"e/"        p "\\~E"
"ai/"       p "A\\~I"
"o/"        p "\\~O"
"au/"       p "A\\~U"

@end
