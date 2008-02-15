% ack2mm.pat --- patterns to convert transcription used in A.C.K
%                (designed by Mathai Chundat) to my transcription
% copyright 1993 Jeroen Hellingman
% last edit: 22-JAN-1993, 14-SEP-1995 (new transcription scheme), 04-MAY-1998
%
% I use a different transcription, that is more regular than the
% A.C.K. one, and in line with the transcriptions I use for other
% Indian languages. The things I prefer in MC's transcription
% is the use of nG, nnG, nJ, and nnJ. but I didn't use G, since I
% use it in transcription of Hindi for something else. I may change
% my transcription to accept both in Malayalam -- there are some
% differences anyway, for example, in Hindi I use e for ee.
%
% KNOWN PROBLEMS:
% colon may stand for itself or for visargam; this file assumes the visargam.


@patterns 0
"<malayalam>" 1 "$"
"$"         1 "$"

@patterns 1
"</malayalam>" 0 "$"
"$"         0 "$"
% vowels
"a"         p "a"
"aa"        p "aa"
"A"         p "aa"
"i"         p "i"
"ee"        p "ii"
"u"         p "u"
"oo"        p "uu"
"R~"        p "R"
"e"         p "e"
"E"         p "ee"
"o"         p "o"
"O"         p "oo"
"ai"        p "ai"
"ou"        p "au"
"am"        p "am"
":"         p ".h"
"wa"        p "ua"          % u + a = wa (?)
% ka
"k"         p "k"
"kh"        p "kh"
"g"         p "g"
"gh"        p "gh"
"nG"        p "\"n"
"nnG"       p "\"n\"n"
% ca
"ch"        p "c"
"Ch"        p "ch"
"j"         p "j"
"jh"        p "jh"
"nJ"        p "~n"
"cch"       p "cc"
"nnJ"       p "~n~n"
% Ta
"t"         p ".t"
"T"         p ".th"
"D"         p ".d"
"Dh"        p ".dh"
"N"         p ".n"
% ta
"th"        p "t"
"Th"        p "th"
"d"         p "d"
"dh"        p "dh"
"n"         p "n"
"tth"       p "tt"
"tTh"       p "tth"
"tdh"       p "tdh"
"tbh"       p "tbh"
% pa
"p"         p "p"
"ph"        p "ph"
"b"         p "b"
"bh"        p "bh"
"m"         p "m"
% yaraladikaa.l=
"y"         p "y"
"r"         p "r"
"l"         p "l"
"v"         p "v"
"S"         p "sh"
"sh"        p ".s"
"s"         p "s"
"h"         p "h"
"R"         p ".r"
"zh"        p "zh"
"L"         p ".l"
"TT"        p ".r.r"
@end
