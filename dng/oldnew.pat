% oldnew.pat -- from old to new scheme in Devanagari TeX
% Copyright 1995 Jeroen Hellingman
%
% History
%   21-NOV-1995 Last Edit (JH)

@patterns 0
"$"     1 "$"
"$$"    1 "$$"

@patterns 1
"$"     0 "$"
"$$"    0 "$$"

"OM"    p "OM"

"~"		p "/"
".r"    p "R"
".r.r"  p "RR"
".l"    p "L"
".l.l"  p "LL"

"M"     p ".m"
"H"     p ".h"

"Kh"    p ".kh"
"G"     p ".g"
"n\""	p "\"n"
"n~"	p "~n"
"T"     p ".t"
"Th"    p ".th"
"D"     p ".d"
"Dh"    p ".dh"
"N"     p ".n"
"S"     p ".s"
"L"     p ".l"
"R"     p ".r"
"Rh"    p ".rh"

"a\""   p ".e"
"o\""   p ".o"

@end
