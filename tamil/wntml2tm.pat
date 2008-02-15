% wntml2tm.pat -- patterns for wntml transliteration scheme for tamil.
% Copyright 1992, 1995, 1997 Jeroen Hellingman
%
% History:
%	29-OCT-1997 updated again (JH)
%   23-NOV-1995 updated for new transcription scheme (JH)
%   22-DEC-1992 created (Jeroen Hellingman)
%
% ~
% a aa i ii u uu e ee ai o oo au
% k ng c 5 8 3 t n p m y r l v 7 9 6 2
% j 4 s x
% ~
%
% translates to
%
% <tm>
% a aa i ii u uu e ee ai o oo au .k
% k "n c ~n .t .n t n p m y r l v zh .l .r _n
% j .s s h k.s
% </tm>

@patterns 0
"\\input tamilmax"  	p "\\input tamilmax\n\\input tmlmacs"
"\\input tamilmax.tex"  p "\\input tamilmax\n\\input tmlmacs"

"~"             1 "<tm>"
"\t"            p " "
"\\"            t                   % copy a tex command
"%"             s                   % skip comment

@rpatterns 1
"~"             0 "</tm>"
"\\"            t                   % copy a tex command
"%"             s                   % skip comment

" " 			p " "
"(" 			p "("
")" 			p ")"

"a"             p "a"
"aa"            p "aa"
"i"             p "i"
"ii"            p "ii"
"u"             p "u"
"uu"            p "uu"
"e"             p "e"
"ee"            p "ee"
"ai"            p "ai"
"o"             p "o"
"oo"            p "oo"
"au"            p "au"

"k"             p "k"
"ng"            p "\"n"

"c"             p "c"
"j"             p "j"
"5"             p "~n"

"8"             p ".t"
"3"             p ".n"

"t"             p "t"
"d" 			p "t"
"n"             p "n"

"p"             p "p"
"m"             p "m"

"y"             p "y"
"r"             p "r"
"l"             p "l"
"v"             p "v"
"7"             p "zh"
"9"             p ".l"
"6"             p ".r"
"2"             p "_n"
"4"             p ".s"
"s"             p "s"
"x"             p "k.s"

@end
