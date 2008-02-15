% adami.pat -- patterns for ADAMI transliteration scheme for tamil.
% Copyright 1992, 1995, 1997 Jeroen Hellingman
%
% History:
%	29-NOV-1997 updated again (JH)
%   23-NOV-1995 updated for new transcription scheme (JH)
%   22-DEC-1992 Created (Jeroen Hellingman)
%
% <adami>
% a aa i ee u oo e E ai o O aw/au  q
% k/g n/NG ch n/NY t/d n/N th/dh n/nN p/b m y/Y r l v zh L R n
% j sh s x/ksh
% </adami>
%
% translates to:
%
% <tm>
% a aa i ii u uu e ee ai o oo au .k
% k "n c ~n .t .t t n p m y r l v zh .l .t _n
% j .s s h k.s
% </tm>

@patterns 0
"<adami>"      	1 "<tm>"
"</adami>"     	e "</adami> found in Roman mode"
"\t"            p " "
"\\"            t                   % copy a tex command
"%"             s                   % skip comment

@patterns 1
"<adami>"       e "<adami> found in ADAMI mode"
"</adami>"     	0 "</tm>"
"\\"            t                   % copy a tex command
"%"             s                   % skip comment

"a"             p "a"
"aa"            p "aa"
"i"             p "i"
"ee"            p "ii"
"u"             p "u"
"oo"            p "uu"
"e"             p "e"
"E"             p "ee"
"ai"            p "ai"
"o"             p "o"
"O"             p "oo"
"ow"            p "au"
"au"            p "au"

"q"             p ".k"

"k"             p "k"
"g"             p "g"
"NG"            p "\"n"
"nk"            p "\"nk"
"ng"            p "\"nk"

"ch"            p "c"
"j"             p "j"
"NY"            p "~n"
"nch"           p "~nc"
"nj"            p "~nj"

"t"             p ".t"
"d"             p ".t"
"N"             p ".n"
"nt"            p ".n.t"
"nd"            p ".n.t"

"th"            p "t"
"dh"            p "t"
"nN"            p "n"
"nth"           p "nt"
"ndh"           p "nt"

"p"             p "p"
"b"             p "p"
"m"             p "m"

"y"             p "y"
"Y"             p "y"
"r"             p "r"
"v"             p "v"
"l"             p "l"
"zh"            p "zh"
"n"             p "_n"
"L"             p ".l"
"R"             p ".r"
"sh"            p ".s"
"s"             p "s"
"x"             p "k.s"
"ksh"           p "k.s"

@end
