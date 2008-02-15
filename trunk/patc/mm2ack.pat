% mm2ack.pat --- patterns to convert my transcription to
%                transcription used in A.C.K (designed by Mathai Chundat)
% Copyright 1993, 1995 Jeroen Hellingman
%
% History:
%   21-NOV-1995 modified for new transcription scheme (JH)
%   22-JAN-1993 created (Jeroen Hellingman)

@patterns 0
"<malayalam>" 1 "<malayalam>"
"$"         1 "<malayalam>"

@patterns 1
"</malayalam>" 0 "</malayalam>"
"$"         0 "</malayalam>"
% vowels
"a"         p "a"
"aa"        p "aa"
"i"         p "i"
"ii"        p "ee"
"u"         p "u"
"uu"        p "oo"
"R"         p "R~"
"e"         p "e"
"ee"        p "E"
"o"         p "o"
"oo"        p "O"
"ai"        p "ai"
"au"        p "ou"
"am"        p "am"
".h"        p ":"
"ua"        p "wa"          % u + a = wa (?)
% ka
"k"         p "k"
"kh"        p "kh"
"g"         p "g"
"gh"        p "gh"
"\"n"       p "nG"
"\"n\"n"    p "nnG"
% ca
"c"         p "ch"
"ch"        p "Ch"
"j"         p "j"
"jh"        p "jh"
"~n"        p "nJ"
"cc"        p "cch"
"~n~n"      p "nnJ"
% .ta
".t"        p "t"
".th"       p "T"
".d"        p "D"
".dh"       p "Dh"
".n"        p "N"
% ta
"t"         p "th"
"th"        p "Th"
"d"         p "d"
"dh"        p "dh"
"n"         p "n"
"tt"        p "tth"
"tth"       p "tTh"
"tdh"       p "tdh"
"tbh"       p "tbh"
% pa
"p"         p "p"
"ph"        p "ph"
"b"         p "b"
"bh"        p "bh"
"m"         p "m"
% yaraladikaaL
"y"         p "y"
"r"         p "r"
"l"         p "l"
"v"         p "v"
"sh"        p "S"
".s"        p "sh"
"s"         p "s"
"h"         p "h"
".r"        p "R"
"zh"        p "zh"
".l"        p "L"
".r.r"      p "TT"
@end
