% dn2dng.pat -- convert Frans Velthuis' notation to my notation
% Copyright 1993, 1995 Jeroen Hellingman
%
% History:
%   04-MAY-1998 Minor modifications (JH)
%   23-NOV-1995 Updated for new transcription scheme (JH)
%   21-NOV-1995 Last Edit (Jeroen Hellingman)

@patterns 0
"{\\dn"     e "I can't match braces; I can only work with dollarmode"
"$"     1 "$"

@patterns 1
"$"     0 "$"

"A"     p "aa"
"I"     p "ii"
"U"     p "uu"
".r"        p "R"
".R"        p "RR"
".l"        p "L"
".L"        p "LL"
"E"     p "ai"
"O"     p "au"


% take care of ambiguities

"aI"        p "a<ii"
"aU"        p "a<uu"

% consonants

"K"     p "kh"
"G"     p "gh"
".kh"       p ".kh"
".K"        p ".kh"
".g"        p ".g"
"\"n"       p "\"n"

"C"     p "ch"
"J"     p "jh"
"~n"        p "~n"

".t"        p ".t"
".T"        p ".th"
".d"        p ".d"
".D"        p ".dh"
".n"        p ".n"
"R"     p ".r"
"Rh"        p ".rh"

"P"     p "ph"
"B"     p "bh"

"\"s"       p "sh"
".s"        p ".s"

"L"     p ".l"

"/"     p "/"

".o"        p "OM"

"M"     p ".m"
"H"     p ".h"

"~a"        p ".e"
"~o"        p ".o"
"~r"        p "r\""
"&"     p "+"
".."        p "."

@end
