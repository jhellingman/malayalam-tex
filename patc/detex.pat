% detex.patc -- maak van een TeX-bestand (bijna) kale PC/ST-ASCII
% copyright Jeroen Hellingman 1993
% laatste wijziging: 01-MAY-1993

@patterns 0

"%"         s   skip commentaar
"\\"        T   verwijder TeX commando's
"{"         f
"}"         f
"#"         f
"&"         f

% math-mode proberen we niet eens (skippen)

"$"         1 "$"
"$$"        1 "$$"

% index commando's \`a la The TeXbook slopen we er ook uit

"^{"        f
"^^{"       B  skip till closing brace

"<"             S  ">" skip till closing bracket

% wat speciale dingen

"\\footnote" e "\\footnote in text"
"\\halign"   e "\\halign in text"
"\\item"     e "\\item in text"

"\\dots"    p "..."
"\\ "       p " "
"\\par"     p "\n\n"
"\\paragraaf" f
"\\paragraph" f
"\\i "      p "i"
"{\\i}"     p "i"
"\\i}"      p "i"

"\\#"       p "#"
"\\$"       p "$"
"\\&"       p "&"
"\\%"       p "%"
"~"         p " " non-breaking space

% letters met accenten, voorzover aanwezig in de Atari-ST character set.

"\\c C"     p "�"
"\\c{C}"    p "�"
"\\\"u"     p "�"
"\\'e"      p "�"
"\\^a"      p "�"
"\\\"a"     p "�"
"\\`a"      p "�"
"\\aa "     p "�"
"{\\aa}"    p "�"
"\\c c"     p "�"
"\\c{c}"    p "�"
"\\^e"      p "�"
"\\\"e"     p "�"
"\\`e"      p "�"
"\\\"\\i "  p "�"
"{\\\"\\i}" p "�"
"\\\"{\\i}" p "�"
"\\^\\i "   p "�"
"{\\^\\i}"  p "�"
"\\^{\\i}"  p "�"
"\\^\\i\\ " p "� "
"\\`\\i "   p "�"
"{\\`\\i}"  p "�"
"\\`{\\i}"  p "�"
"\\`\\i\\ " p "� "
"\\\"A"     p "�"
"\\AA "     p "�"
"{\\AA}"    p "�"
"\\'E"      p "�"
"\\ae "     p "�"
"{\\ae}"    p "�"
"\\AE "     p "�"
"{\\AE}"    p "�"
"\\^o"      p "�"
"\\\"o"     p "�"
"\\`o"      p "�"
"\\^u"      p "�"
"\\`u"      p "�"
"\\\"O"     p "�"
"\\\"U"     p "�"
"\\ss "     p "�"
"\\ss\\ "   p "� "
"{\\ss}"    p "�"
"\\'a"      p "�"
"\\'\\i "   p "�"
"{\\'\\i}"  p "�"
"\\'{\\i}"  p "�"
"\\'\\i\\ " p "� "
"\\'o"      p "�"
"\\'u"      p "�"
"\\~n"      p "�"
"\\~N"      p "�"
"`?"        p "�"
"`!"        p "�"
"\\~a"      p "�"
"\\~o"      p "�"
"\\O "      p "�"
"{\\O}"     p "�"
"\\O\\ "    p "� "
"\\o "      p "�"
"{\\o}"     p "�"
"\\o\\ "    p "� "
"\\oe "     p "�"
"{\\oe}"    p "�"
"\\OE "     p "�"
"{\\OE}"    p "�"
"\\`A"      p "�"
"\\~A"      p "�"
"\\~O"      p "�"

% letters met accenten, niet aanwezig in ST character-set

"\\l "      p "l"       Poolse l-streep
"{\\l}"     p "l"
"\\L "      p "L"       Poolse L-streep
"{\\L}"     p "L"

"\\d "      f           dot under
"{\\d}"     f           dot under

@patterns 1 (voor math-mode)
"$"         0 "$"
"$$"        0 "$$"

@end
