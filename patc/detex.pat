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

"\\c C"     p "Ä"
"\\c{C}"    p "Ä"
"\\\"u"     p "Å"
"\\'e"      p "Ç"
"\\^a"      p "É"
"\\\"a"     p "Ñ"
"\\`a"      p "Ö"
"\\aa "     p "Ü"
"{\\aa}"    p "Ü"
"\\c c"     p "á"
"\\c{c}"    p "á"
"\\^e"      p "à"
"\\\"e"     p "â"
"\\`e"      p "ä"
"\\\"\\i "  p "ã"
"{\\\"\\i}" p "ã"
"\\\"{\\i}" p "ã"
"\\^\\i "   p "å"
"{\\^\\i}"  p "å"
"\\^{\\i}"  p "å"
"\\^\\i\\ " p "å "
"\\`\\i "   p "ç"
"{\\`\\i}"  p "ç"
"\\`{\\i}"  p "ç"
"\\`\\i\\ " p "ç "
"\\\"A"     p "é"
"\\AA "     p "è"
"{\\AA}"    p "è"
"\\'E"      p "ê"
"\\ae "     p "ë"
"{\\ae}"    p "ë"
"\\AE "     p "í"
"{\\AE}"    p "í"
"\\^o"      p "ì"
"\\\"o"     p "î"
"\\`o"      p "ï"
"\\^u"      p "ñ"
"\\`u"      p "ó"
"\\\"O"     p "ô"
"\\\"U"     p "ö"
"\\ss "     p "û"
"\\ss\\ "   p "û "
"{\\ss}"    p "û"
"\\'a"      p "†"
"\\'\\i "   p "°"
"{\\'\\i}"  p "°"
"\\'{\\i}"  p "°"
"\\'\\i\\ " p "° "
"\\'o"      p "¢"
"\\'u"      p "£"
"\\~n"      p "§"
"\\~N"      p "•"
"`?"        p "®"
"`!"        p "≠"
"\\~a"      p "∞"
"\\~o"      p "±"
"\\O "      p "≤"
"{\\O}"     p "≤"
"\\O\\ "    p "≤ "
"\\o "      p "≥"
"{\\o}"     p "≥"
"\\o\\ "    p "≥ "
"\\oe "     p "¥"
"{\\oe}"    p "¥"
"\\OE "     p "µ"
"{\\OE}"    p "µ"
"\\`A"      p "∂"
"\\~A"      p "∑"
"\\~O"      p "∏"

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
