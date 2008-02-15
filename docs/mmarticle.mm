% mmarticle.mm -- article about Malayalam TeX
% Copyright 1993, 1998 Jeroen Hellingman
%
% History:
%   10-MAY-1998 updated text (JH)
%   04-MAY-1998 updated transcription (JH)
%   23-NOV-1995 updated for new transcription scheme (JH)
%   02-APR-1993 Created (JH)

\input mmmacs
\input mmtrmacs

\def\q{\hfill\quad}
\def\os{\oldstyle}
\font\logo=logo10
\def\MF{{\logo METAFONT}}
\parindent=0pt

\def\today{\number\day\space\ifcase\month\or January\or February\or March\or April\or May\or
        June\or July\or August\or September\or October\or November\or December\fi
        \space\number\year}

\headline={{\it preliminary version of \today \hfil Typesetting Malayalam with \TeX}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\centerline{\twelvebf Typesetting Malayalam with \TeX}\bigskip
\centerline{Jeroen Hellingman}\bigskip

{\narrower
\noindent{\bf Abstract}\medskip

\noindent Malayalam, a language spoken in the Indian state of Kerala,
employs a beautiful but complicated script. This script uses numerous
ligatures and places glyphs on top of each other and out of phonetic
order. To be able to typeset Malayalam, a \MF\ containing all
necessary letter forms, a pre-processor and a collection of
\TeX-macro's were designed. Together they form a package called
Malayalam-\TeX. This package enables the user to type Malayalam in an
adaptable roman transliteration, which after being processed by the
pre-processor, can be typeset with \TeX.

During the design and development of the package, several shortcomings
of the \TeX\ system appeared, which made a straightforward
implementation of the Malayalam script difficult. Several additions to
\TeX\ would have made the pre-processor unnecessary. Still, \MF\ and
\TeX\ together proved to be a powerful tool that made the development
of the package an enjoyable task.\par}

\beginsection Introduction

The Malayalam language, ($malayaa.lam$), is the first language of
an estimated {\os30}~million people in the South Indian state Kerala and 
a few million Malayalees scattered all over India, the Middle East, the U.S.,
Europe and South-East Asia. Malayalam
uses its own script, which is characterised by curly shaped
characters. It is believed that those rounded shapes developed because
it was written on palm leaves with a metal nib, which would have
pricked through the medium, if the script had contained sharp curves.
The same rounded shapes can be found in the other South Indian and
Sri~Lankan scripts, which are all closely related to Malayalam script.

Through the centuries, Malayalam has been written in various scripts
and variations of scripts. Until a few centuries ago, the Malayalam
language was normally written in the Old Tamil or $^mappi.l.la$
($$^mappi.l.la$$) alphabet, also known as $va.t.tezhuttu$
($$va.t.tezhuttu$$), the `rounded characters'. This script however, did
not contain many letters necessary for writing Sanskrit. They became
necessary in writing Malayalam since the language absorbed many
Sanskrit loans, which could only be written in an ambiguous way.

To overcome those problems, the {\os17}th~century poet $^tu~njettu
^ezhuttaccha..n$ ($$^tu~njettu ^ezhuttaccha..n$$)\footnote*{literally
``Father of Letters.''} adopted the modern Malayalam script, the
so-called $^aaryavezhuttu$ ($$^aaryavezhuttu$$) or `Aryan characters'
from the Tamil Grantha alphabet to render Sanskrit poetry in
Malayalam. Tamil Grantha, in its turn, was derived from the ancient
Brahmi script. His alphabet quickly became the standard for writing
Malayalam. (however, a variant of the old script, called $koolezhuttu$
($$koolezhuttu$$) was in use far into this century for keeping records
in the Raja's palaces.)

The Malayalam script still looks very similar to the Tamil script, but
unlike Tamil, it uses complex conjunct characters, with letters
subscribed to others, and out of phonetic order, as can be seen in
most Indian scripts.

Malayalam is a close contender with Tamil for being the first Indian
language to be printed in movable type. The oldest existing work printed
in any Indian script, was printed in 1580 in Cochin, however, that is
in Tamil.

With the more widescale introduction of the printing press in Kerala, somewhere in
the {\os18}th~century, printing letters for Malayalam where designed,
modelled after the, at that time, popular Latin Bodoni types, with
large differences between thin and thick strokes. Printing Malayalam,
however, proved to be quite complicated; in traditional typography,
several hundreds of distinct lead glyphs where needed to typeset the
language.

To ease learning and typesetting, the government of the state of
Kerala adopted a reformed script in {\os1974}. It abandons most of the
subscribed conjuncts and all the irregular vowel signs. Although this
script is now tought in all schools in Kerala, and newspapers are
printed in it, the original script is still in widespread use, and
mixtures of the two styles in one document can be seen regularly. In
the following section I will explain the reformed script.

\beginsection The Malayalam Script

Like all scripts derived from Brahmi, Malayalam script is neither
purely syllabic, nor purely alphabetic. The modern alphabet consists
of {\os61}~syllabic characters, {\os15}~for the pure vowel sounds, and
{\os36}~for the consonants followed by an `inherent'~$$a$$. To write a
syllable with another vowel, a special sign is applied to the normal
consonant character. When two consonants appear next to each other
without an intermediate vowel, They are joined to each other in some
way.

Traditionally, the Malayalam syllabary has been ordered, following the
Sanskrit order, on phonetic principles, putting related sounds
together. For the sounds not used in Sanskrit, new letters where added
to the end of the syllabary.

\noindent The vowels are:\footnote*{The traditional alphabet also
includes the Sanskrit vowels $RR$, $L$, and $LL$ for respectively
$$RR$$, $$L$$, and $$LL$$.}

\bigskip
\centerline{\vbox{\twelvemmc\halign{#\q&#\q&#\q&#\q&#\q&#\q&#\cr
$a$     & $aa$      & $i$   & $ii$      & $u$   & $uu$      & $R$    \cr
$$a$$   & $$aa$$    & $$i$$ & $$ii$$    & $$u$$ & $$uu$$    & $$R$$  \cr
$e$     & $ee$      & $ai$  & $o$       & $oo$  & $au$      \cr
$$e$$   & $$ee$$    & $$ai$$& $$o$$     & $$oo$$& $$au$$    \cr
}}}
\bigskip

\noindent After the vowels, are normally listed the modifiers $.m$,
$$.m$$, and $.h$, $$.h$$. They are called {\it anusvaram} and {\it
visargam} and represent a nasal sound and an aspiration respectively.

The consonants are:

\bigskip
\centerline{\vbox{\twelvemmc\halign{#\q&#\q&#\q&#\q&#\q\q\q&#\q&#\q&#\q&#\cr
$ka$      & $kha$     & $ga$      & $gha$     & $"na$    & $ya$     & $ra$      & $la$      & $va$      \cr
$$ka$$    & $$kha$$   & $$ga$$    & $$gha$$   & $$"na$$  & $$ya$$   & $$ra$$    & $$la$$    & $$va$$    \cr
$ca$      & $cha$     & $ja$      & $jha$     & $~na$    & $sha$    & $.sa$      & $sa$      \cr
$$ca$$    & $$cha$$   & $$ja$$    & $$jha$$   & $$~na$$  & $$sha$$  & $$.sa$$    & $$sa$$    \cr
$.ta$      & $.tha$     & $.da$      & $.dha$     & $.na$     & $ha$     & $.la$      & $zha$      & $.ra$      \cr
$$.ta$$    & $$.tha$$   & $$.da$$    & $$.dha$$   & $$.na$$   & $$ha$$   & $$.la$$    & $$zha$$    & $$.ra$$    \cr
$ta$      & $tha$     & $da$      & $dha$     & $na$     \cr
$$ta$$    & $$tha$$   & $$da$$    & $$dha$$   & $$na$$   \cr
$pa$      & $pha$     & $ba$      & $bha$     & $ma$     \cr
$$pa$$    & $$pha$$   & $$ba$$    & $$bha$$   & $$ma$$   \cr
}}}
\bigskip

\noindent When a vowel follows a consonant, it is written with a vowel
sign, some of them standing to the left, or on both sides of the
consonant to which they belong. This can be quite confusing in the
when one starts learning the script. Here the vowel signs are given
with the letter $ka$, {\it$$ka$$}:

\bigskip
\centerline{\vbox{\twelvemmc\halign{#\q&#\q&#\q&#\q&#\q&#\q&#\cr
$ka$     & $kaa$      & $ki$   & $kii$      & $ku$   & $kuu$      & $kR$    \cr
$$ka$$   & $$kaa$$    & $$ki$$ & $$kii$$    & $$ku$$ & $$kuu$$    & $$kR$$  \cr
$ke$     & $kee$      & $kai$  & $ko$       & $koo$  & $kau$      \cr
$$ke$$   & $$kee$$    & $$kai$$& $$ko$$     & $$koo$$& $$kau$$    \cr
}}}
\bigskip

\noindent The biggest complexities arise when two consonants follow
each other. In that case there are several alternatives. First, the
consonants are joined with each other to form a new conjunct, like in
$jja$, $nta$, and $.n.ta$; second one can write the second consonant as
a subscript to the first, like in $ppa$, and $.n.na$; the third option
is to use a special symbol, $+$, called $candrakala$,
{\it$$candrakala$$}, to indicate the absence of the inherent vowel in
a consonant. This symbol is also used when a word ends in a consonant.
Several letters form a ligature with this sign: $.n$ for
$.na+$, $t$ for $la+$, $n$ for $na+$, $r$ for
$ra+$, and $.l$ for $.la+$. In some older works one can also find $k$ for $ka+$.

Some consonants have a special sign when they occur as the last
element of a consonant cluster:
$ya$ becomes ${}<<ya$ as in $kya$, {\it$$kya$$};
$ra$ becomes ${}<<ra$ , standing to the left of the cluster, as in
$kra$, {\it$$kra$$};
$la$ becomes ${}<<la$, as in $kla$, {\it$$kla$$}; and
$va$ becomes ${}<<va$ as in $kva$, {\it$$kva$$}.

\beginsection The font

I faced several problems while designing the font for Malayalam: I
have no knowledge of the language; I had no clear arrangement of all
needed conjuncts, nor a good example typeface, which I could use as a
guideline; and finally, I also had very little experience with \MF.

After some trials, in which I produced Malayalam letters in the
traditional typographic style, I decided to switch to a `script' style
of letters, for two reasons. First designing and coding a font in the
traditional style, with unnatural thick-thin transitions --~i.e.,
transitions that do not appear when writing with a calligraphic
pe~n--, would have cost a lot of time, which I could not spend on
it. Second, the traditional design is hard on the eyes, because it has
a big difference between thick and thin. It often produces a page
which looks `stained' from distance, instead of the more evenly
distributed gray you see when you look at a page typeset in English.

After this decision was made, I proceeded as follows. First, I drew
each character about {\os2}~centimetres high out of free hand on graph
paper with a yellow marker-pen, the same type you use to highlight
text. When I was satisfied with this character, I decided where to put
control points, and marked them with a black dot, measured the
positions of the dots on the graph paper and coded them, together with
the path my pen had made through those points, in \MF. After running
\MF\ the character appeared on the screen for the first time. When I
was not satisfied with its look, I would move some control points a
bit, and re-run \MF. I repeated this process until I was satisfied
with the character.

Because many conjuncts consist of a part of each of the characters it
is build up of, I defined a macro for most consonants. This way all
that was needed to define the shape of a conjunct was a macro-call for
each of the constituent consonants, sometimes adjusting some points
where one consonant goes over into the other.

This way of producing characters has proven very productive. I spend
on average about half an hour per character --~although I needed
several hours to get some, notably $ja$ and $ya$, right~-- Still the
results are acceptable, thanks to \MF, which does a great job of
producing nice curves.

Malayalam script includes many conjuncts of consonants which are build
by placing a smaller variant of the glyph of the second consonant
below the normal sized glyph of the first consonant. To avoid coding
these smaller consonants again, I decided to create a second font,
called the {\it subfont\/}, which contains only the characters that
can be subscribed. This font uses the same code to produce the glyphs,
but \MF-parameters have been adjusted, so that this font combines well
with the `main'-font. The job of combining glyphs from the `sub' and
`main' font to create stacked conjuncts is left to \TeX.

My way of coding glyphs results in little `{\logo META}-ness'. Unlike
Donald Knuth's Computer Modern fonts, only a few variations in letter
style can be derived from the \MF-source. I produced several styles: a
regular, slanted, and bold style drawn with a circular pen, and a
style drawn with a `calligraphic' (elliptical) pen, in {\os6}, {\os8},
{\os10}, {\os12}, and {\os17} point sizes. Beside those those, I
created some `big' bold fonts for headlines and a few more
experimental fonts. A sample of each style is given in appendix~C.

\beginsection Typesetting Malayalam

When you have a font for the English alphabet, typesetting is
straightforward. Roughly speaking, all you have to do is to place the
letters in a row, in the same order as you type them, taking care to
move to the next line when the current line is filled up. There is
roughly a one-to-one relationship between characters, letters, and
glyphs. Typesetting Malayalam text is much more complicated. You have
to use conjuncts, stack glyphs on top of each other, or place glyphs
that represent sounds that come after a consonant before the glyph of
representing that consonant.

But when we look at Malayalam script from a different position, it can
be said to consist of syllables, which are just as easily placed on a
line from left to right as English. The remaining problem is how to
construct the syllables.

Here it is where \TeX's box-building capabilities come to the rescue.
To build a syllable, you can put a glyph in a box, place it relative
to another character, and put the resulting construction into another
box for use it in further constructing, until the syllable is
complete, and it can be added to the current line.

As has been shown by the implementation of Telugu-\TeX\ [???], it is
possible to let \TeX\ do all the necessary processing, however, at a
high cost in both processor load and memory usage at run time, which
makes it impossible to use Telugu-\TeX\ on a small personal computer.
Also, programming these tasks in the \TeX-programming language is
awkward, requiring many `dirty tricks'. For these reasons I decided to
implement a pre-processor, written in~C, which does most of the
syllable-composing work.

Another problem in typesetting Malayalam is that this language has
many very long `words'. Both in speaking as in writing, the boundaries
between words tend to disappear, and often the last letter of a word
changes and/or forms a conjunct with the first of the next word. This
effect, know as `Sandhi', appears in most languages, but in Malayalam
it is quite prominent, and also reflected in the orthography. As a
result, a text contains very long sequences of characters and few
spaces, which can serve as line-break points. As a result, it is
difficult to obtain even spacing between words, especially in narrow
columns. Several of \TeX's line-breaking parameters had to be adjusted
to get acceptable results.

\beginsection Typing Malayalam

Now that we have all the elements to {\it output\/} Malayalam, we need
some way to {\it input\/} it. Unfortunately, I have no keyboard or
editor on which I can type Malayalam script directly. So I was forced
to use some transcription scheme in ASCII. The transcription I decided
to use was based on the following principles. First it should be
easily readable, avoiding as much as possible non-letters and capital
letters in the middle of words, non-ambiguous, so that it can be
converted automatically, easily recognisable, and finally, besides
being able to produce Malayalam text from it, I wanted to be able to
create a scientific transcription from the same source.

However desirable some standard transcription may be, people can be
very `religious' about what they consider a good transcription-scheme.
Beside that they can also have huge texts already available in some
transcription, and be unwilling to convert that, so I decided to have
the pre-processor read the transcription from a file, which can easily
be changed to reflect the users favourite transcription.

The transcription method is only of limited use to native speakers,
who may not even know the roman alphabet, and also awkward for
entering large pieces of text, since many typing errors only show up
when the text is seen after processing by \TeX, so it should be
replaced by some way of entering text directly.

\beginsection Some thoughts on a future \TeX\par

Creating a typesetting system for Malayalam was an enjoyable task, in
which \TeX\ and \MF\ proved to be very powerful tools. Still, many
things remain to be desired. The pre-processing stage, and the need to
represent non-Latin scripts with a sequence of inpenetratable commands
to typeset glyphs is far from ideal. A much more workable scheme would
be to have \TeX\ understand that some characters are Malayalam
characters, while others are Latin or from yet another script, and
have \TeX\ typeset them as such correctly, including contextual
analysis.

This first of all raises the issue of character-sets. Some few years
ago, Donald Knuth decided to move from 7-bit to 8-bit characters, as a
final concession to user-demand for multi-lingual support, but by now
it would be very desirous to make the leap to 16-bit characters, and
have \TeX\ understand the emerging 16-bit Unicode or ISO-10464~UCS
character set standard, and make \TeX\ really
multi-lingual.\footnote*{multi-lingual does not mean `omni'-lingual,
since many more obscure or obsolete writing systems have been left
out of ISO-10464}

Having all the characters defined isn't enough. \TeX\ needs to deal
with them in a way that makes sense. Nowadays, \TeX\ only truly
understands two writing systems --~that of English, and that of
mathematics~-- and does a wonderful, although not perfect, job in
handling those. But other scripts require some kind of pre-processor,
or extremely clever hacking with \TeX-macros, as is is done in Klaus
Lagally's Arab\TeX\ or in Telugu-\TeX. A more elegant solution would
be to add more modes to \TeX, for example an Arabic-mode for the
Arabic script, and a Malayalam mode for Malayalam script --~one can,
however, also imagine one generalized mode for all Indic scripts~--,
and to take the idea further, a mode for music and dance notation, and
chemical structure formulas.

I suggest to take a modular approach in creating these modes, to make
the development of these a manageable task; no single person can know
all the relevant details of all writing systems. A script or writing
system `module' or `driver' would come into action whenever a
character of its script, or token requiring the explicit change of
mode, is encountered, and handle all consequent characters and tokens,
until one arrives that it cannot handle --~these may include some
normal tokens like a `space' character, which is common in most
writing systems.

While processing its part of the input, a module will add boxes to the
current horizontal list, which will then be handled by \TeX's
paragraph handling mechanism as usual --~although some extensions may
be needed, as to handle right-to-left and top-down scripts correctly.

Each script module would have its own active fonts, and knowledge of
how to represent characters with the glyphs of that font. An extended
font metric format should provide information about how to build
conjunct forms or use contextual variants of glyphs available in a
font.

A nice starting point may be the Japanese P-\TeX-system, which already
supports a 16-bit character set, and also incorporates code to do
vertical typesetting as is required by some writing systems. The
adaptation of P-\TeX\ to Unicode for at least the ideographic
characters will be reasonable straightforward. Adding the various
script modules and extra character-categories may be more difficult.

In the long term, I favour, however, a completely redesigned batch
oriented text formatter like \TeX, but one that understands Unicode
and uses functional instead of typographical tagging of the input
text. Preferably it would understand SGML, and format this using some
lay-out style definition, which then should be defined in a language
less arcane than \TeX's.

\MF, I would like to see develop into an interactive program, in which
points, constrains between points and pen strokes through them can be
added or moved and their effects can be seen immediately. I very much
prefer the its pen-stroke metaphor above the outline editing most
other font design tools offer, but maybe the idea of changing
`pressure' on or rotation of the a pen during its movement can be
incorporated in this metaphor as well. Its output should of course be
typographically scalable, and also modifiable to add effects like
slanting, bolding, or stretching, --~to align lines of
Arabic or Hebrew script, or, as I have once seen in a beautiful
handwritten letter in Tamil, in scripts where it has not been done
before because of technical limitations~-- in a typographically
acceptable way.

\beginsection Conclusion

Because of the powers of \TeX\ and its companion \MF, automated
typesetting of the traditional script is no longer a big problem.
Malayalam \TeX\ can both produce the traditional style script and the
reformed script, as well as a scientific transliteration from the same
input file.

The world knows many scripts, many of them have only a very limited
use, --~compared with some of them, Malayalam, is a very widely used
script. As shown with my experience with Malayalam, it is only several
months of work to obtain acceptable typesetting quality for most
scripts (The exception being ideographic or logographic scripts as
Chinese), thus bringing computerized typography within the reach of
many people.

\beginsection Appendix A

The following table shows all glyphs in the Malayalam font {\tt mm10}.
\bigskip
\input chart.tex
\table mm10

\beginsection Appendix B

A sample of text in Malayalam, typeset in {\tt mm10}, using the
traditional script, followed by an automatically derived transcription,
an English translation, and finally the transcription actually input.
\bigskip
\input lion.tex

\beginsection Appendix C

\input mmsample

\beginsection Appendix D

The following table shows the character(s) you have to type in order
to produce a Malayalam character. The third column shows the
scientific transliteration of each character.
\bigskip
\input mmtrans

\bye
