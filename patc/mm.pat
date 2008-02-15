% mm.pat --- Malayalam transcription definition for TeX pre-processor
% Copyright 1993, 1995 Jeroen Hellingman
%
% History:
%   04-MAY-1998 Minor changes in scheme (JH)
%   21-NOV-1995 Changed transcription to new scheme (Jeroen Hellingman)

@patterns 0                 % default patterns
"$$"        1 "{\\mmtr "    % begin Malayalam in transcription
"%"         c               % skip comments
"\\"        t               % copy TeX-commands
"\t"        p " "           % tab -> space

@rpatterns 1 patterns ASCII transcription -> scientific transcription in TeX.

"$$"        0 "}"           % switch back to default mode
"$"         e "$ in $$-mode"
">"         f               % eliminate ambiguities
"\\"        t               % copy TeX command
"%"         s               % skip comment
"^"         e "^ in front of non letter"
"^^"        2 ""            % switch to capital mode

"{"         p "{"
"}"         p "}"
"\n"        p "\n"
" "         p " "
"\t"        p " "

"a"         p "a"           % a
"aa"        p "\\=a"        % aa
"i"         p "i"           % i
"ii"        p "{\\=\\i}"    % ii
"u"         p "u"           % u
"uu"        p "\\=u"        % uu
"R"         p "\\d r"       % vocalic r
"RR"        p "{\\rii}"     % vocalic rr
"L"         p "\\d l"       % vocalic l
"LL"        p "{\\lii}"     % vocalic ll
"e"         p "e"
"ee"        p "\\=e"
"ai"        p "ai"
"o"         p "o"
"oo"        p "\\=o"
"au"        p "au"
"~au"       p "au"          % au length mark

% modifiers

".m"        p "\\d m"       % anusvaram
".h"        p "\\d h"       % visargam

% consonants

"k"         p "k"
"kh"        p "kh"
"g"         p "g"
"gh"        p "gh"
"\"n"       p "\\.n"        % nga

"c"         p "c"
"ch"        p "ch"
"j"         p "j"
"jh"        p "jh"
"~n"        p "\\~n"        % nya

".t"        p "\\d t"
".th"       p "\\d th"
".d"        p "\\d d"
".dh"       p "\\d dh"
".n"        p "\\d n"

"t"         p "t"
"..t"       p "\\b t"       % dental ta
"th"        p "th"
"d"         p "d"
"dh"        p "dh"
"n"         p "n"
"..n"       p "\\b n"       % dental na

"p"         p "p"
"ph"        p "ph"
"f"         p "f"
"b"         p "b"
"bh"        p "bh"
"m"         p "m"

"y"         p "y"
"r"         p "r"
".r"        p "\\b r"
".r.r"      p "\\b t"       % double Ra is dental t
"..t..t"    p "\\b t"       % double Ra is dental t
"l"         p "l"
".l"        p "\\d l"
"zh"        p "\\b z"
"v"         p "v"
"sh"        p "\\'s"
".s"        p "\\d s"
"s"         p "s"
"h"         p "h"

"="     f
"+"         f               % virama
"u+"        p "\\u u"       % half u

% digits

% special

"<>"        f               % join
"@"         f               % non join
"[]"        p "\\dotcircle" % dotted circle

% interpunction

"."         p "."
"`"         p "`"
"'"         p "'"
","         p ","
":"         p ":"
";"         p ";"
"-"         p "-"
"--"        p "--"
"---"       p "---"
"("         p "("
")"         p ")"
"?"         p "?"
"!"         p "!"
"\\%"       p "\\%"

% repeat partial table for correct transcription of anusvar

".mk"       p "\\.nk"
".mkh"      p "\\.nkh"
".mg"       p "\\.ng"
".mgh"      p "\\.ngh"

".mc"        p "\\~nc"
".mch"       p "\\~nch"
".mj"        p "\\~nj"
".mjh"       p "\\~njh"

".m.t"      p "\\d n\\d t"
".m.th"     p "\\d n\\d th"
".m.d"      p "\\d n\\d d"
".m.dh"     p "\\d n\\d dh"

".mt"        p "nt"
".mth"       p "nth"
".md"        p "nd"
".mdh"       p "ndh"

".mp"        p "mp"
".mph"       p "mph"
".mb"        p "mb"
".mbh"       p "mbh"
".mf"        p "mf"

% repeat table for capital letters

"^a"        p "A"           % a
"^aa"       p "\\=A"        % aa
"^i"        p "I"           % i
"^ii"       p "\\=I"        % ii
"^u"        p "U"
"^uu"       p "\\=U"
"^R"        p "\\d R"       % vocalic r
"^RR"       p "{\\Rii}"     % vocalic rr
"^L"        p "\\d L"       % vocalic l
"^LL"       p "{\\Lii}"     % vocalic ll
"^e"        p "E"
"^ee"       p "\\=E"
"^ai"       p "Ai"
"^o"        p "O"
"^oo"       p "\\=O"
"^au"       p "Au"
"^~au"      p "Au"          % au length mark

% consonants

"^k"        p "K"
"^kh"       p "Kh"
"^g"        p "G"
"^gh"       p "Gh"
"^\"n"      p "\\.N"        % nga

"^c"        p "C"
"^ch"       p "Ch"
"^j"        p "J"
"^jh"       p "Jh"
"^~n"       p "\\~N"        % nya

"^.t"       p "\\d T"
"^.th"      p "\\d Th"
"^.d"       p "\\d D"
"^.dh"      p "\\d Dh"
"^.n"       p "\\d N"

"^t"        p "T"
"^..t"      p "\\b T"
"^th"       p "Th"
"^d"        p "D"
"^dh"       p "Dh"
"^n"        p "N"
"^..n"      p "\\b N"

"^p"        p "P"
"^ph"       p "Ph"
"^f"        p "F"
"^b"        p "B"
"^bh"       p "Bh"
"^m"        p "M"

"^y"        p "Y"
"^r"        p "R"
"^.r"       p "\\b R"
"^l"        p "L"
"^.l"       p "\\d L"
"^zh"       p "\\b Z"
"^v"        p "V"
"^sh"       p "\\'S"
"^.s"       p "\\d S"
"^s"        p "S"
"^h"        p "H"

@rpatterns 2 patterns ASCII transcription -> scientific transcription in TeX in Caps.

"$$"        0 "}"           % switch back to default mode
"$"         e "$ in $$-mode"
">"         f               % eliminate ambiguities
"\\"        t               % copy TeX command
"%"         s               % skip comment
"^"         s               % no capitals in caps-mode
"^^"        1 ""            % switch to normal mode

"{"         p "{"
"}"         p "}"
"\n"        p "\n"
" "         p " "
"\t"        p " "

"a"         p "A"           % a
"aa"        p "\\=A"        % aa
"i"         p "I"           % i
"ii"        p "\\=I"        % ii
"u"         p "U"
"uu"        p "\\=U"
"R"         p "\\d R"       % vocalic r
"RR"        p "{\\RII}"         % vocalic rr
"L"         p "\\d L"       % vocalic l
"LL"        p "{\\LII}"         % vocalic ll
"e"         p "E"
"ee"        p "\\=E"
"ai"        p "AI"
"o"         p "O"
"oo"        p "\\=O"
"au"        p "AU"
"~au"       p "AU"          % au length mark

% modifiers

".m"        p "\\d M"       % anusvara
".h"        p "\\d H"       % visarga

% consonants

"k"         p "K"
"kh"        p "KH"
"g"         p "G"
"gh"        p "GH"
"\"n"       p "\\.N"        % nga

"c"         p "C"
"ch"        p "CH"
"j"         p "J"
"jh"        p "JH"
"~n"        p "\\~N"        % nya

".t"        p "\\d T"
".th"       p "\\d TH"
".d"        p "\\d D"
".dh"       p "\\d DH"
".n"        p "\\d N"

"t"         p "T"
"..t"       p "\\b T"       % dental ta
"th"        p "TH"
"d"         p "D"
"dh"        p "DH"
"n"         p "N"
"..n"       p "\\b N"

"p"         p "P"
"ph"        p "PH"
"f"         p "F"
"b"         p "B"
"bh"        p "BH"
"m"         p "M"

"y"         p "Y"
"r"         p "R"
".r"        p "\\b R"
".r.r"      p "\\b T"       % double Ra is dental t
"..t..t"    p "\\b T"       % double Ra is dental t
"l"         p "L"
".l"        p "\\d L"
"zh"        p "\\b Z"
"v"         p "V"
"sh"        p "\\'S"
".s"        p "\\d S"
"s"         p "S"
"h"         p "H"

"="         f
"+"         f               % virama
"u+"        p "\\u U"       % half u

% digits

% special

"<>"        f               % join
"@"         f               % non join
"[]"        p "\\dotcircle" % dotted circle

% interpunction

"."         p "."
"`"         p "`"
"'"         p "'"
","         p ","
":"         p ":"
";"         p ";"
"-"         p "-"
"--"        p "--"
"---"       p "---"
"("         p "("
")"         p ")"
"\\%"       p "\\%"

% repeat partial table for correct transcription of anusvar

".mk"        p "\\.NK"
".mkh"       p "\\.NKH"
".mg"        p "\\.NG"
".mgh"       p "\\.NGH"

".mc"        p "\\~NC"
".mch"       p "\\~NCH"
".mj"        p "\\~NJ"
".mjh"       p "\\~NJH"

".m.t"        p "\\d N\\d T"
".m.th"       p "\\d N\\d TH"
".m.d"        p "\\d N\\d D"
".m.dh"       p "\\d N\\d DH"

".mt"        p "NT"
".mth"       p "NTH"
".md"        p "ND"
".mdh"       p "NDH"

".mp"        p "MP"
".mph"       p "MPH"
".mb"        p "MB"
".mbh"       p "MBH"
".mf"        p "MF"

@end
