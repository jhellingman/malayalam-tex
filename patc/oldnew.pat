% oldnew.pat -- from old to new scheme in Malayalam TeX
% Copyright 1995 Jeroen Hellingman
%
% History
%   04-MAY-1998 Minor modifications (JH)
%   23-NOV-1995 Added further delimiters (JH)
%   21-NOV-1995 Last Edit (JH)

@patterns 0
"$"         1 "$"
"$$"        1 "$$"
"<malayalam>"   1 "<malayalam>"
"<ml>"      1 "<ml>"
"<mlr>"     1 "<mlr>"

@patterns 1
"$"         0 "$"
"$$"        0 "$$"
"</malayalam>"  0 "</malayalam>"
"</ml>"     0 "</ml>"
"</mlr>"    0 "</mlr>"

".r"    p "R"
".r.r"  p "RR"
".l"    p "L"
".l.l"  p "LL"

"M"     p ".m"
"H"     p ".h"

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
"t_"    p "..t"
"n_"    p "..n"

@end
