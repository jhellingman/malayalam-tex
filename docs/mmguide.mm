% mmguide.mm -- Malayalam-\TeX\ user guide
% Copyright 1993, 1994, 1995 Jeroen Hellingman
%
% pre-process this file using mltr
%
% History
%   04-MAY-1998 Updated transcription (JH)
%   23-NOV-1995 Updated for new transcription scheme (JH)
%   22-JAN-1994 Last edit (JH)
%   22-JAN-1994 Added instruction for getting cillu/virama variants (JH)

\def\editdate{4 May 1998}

\input mmmacs
\input mmtrmacs

\parindent=0pt
\def\@{@}

\def\today{\number\day\space\ifcase\month\or January\or February\or March\or April\or May\or
    June\or July\or August\or September\or October\or November\or December\fi
    \space\number\year}

\def\MT{Malayalam-\TeX}

\headline={{\hfil \it \MT\ v1.6 User's Guide}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\beginsection {\twelvebf Introduction}

\MT\ is a package to typeset Malayalam with
\TeX\footnote*{\MT\ will work only with \TeX3.0 or later
versions of \TeX.}. It can be used to typeset in both
the traditional and reformed script. The complete package
includes a pre-processor and fonts in various styles (regular, bold,
slanted, calligraphic) and various sizes.

Malayalam Text
is entered in an easily adaptable ASCII transcription.
This text is then converted to commands for \TeX\ to typeset
the Malayalam by a pre-processor, which takes care of applying the
correct conjunct letters and placing the vowel signs on the right position.
The same ASCII transcription can also be used to derive scientific
transcription of the text, which will save scholars lots of time
spend in typing the macros for accented letters themselves.

This document assumes a working knowledge of \TeX, and will not
try to explain things already explained in the \TeX-book. It
can roughly be divided in three parts. The first part explains how to
use \MT\ in a standard fashion. The second part goes deeper
into the internals, so that you are able to change the behaviour of
\MT. This part can be skipped if you are happy with the
standard settings. Some appendices complete this manual.

\vfill\eject
\beginsection {\twelvebf Preparing Your Document}

When you want to use \MT, all you have to do is say

\medskip
{\tt\bslash input mmmacs}
\medskip

somewhere near the beginning of your document, before the first
occurrence of Malayalam text, and have the file {\tt mmmacs.tex} in
a directory where it can be found by \TeX. This file will load the
fonts and define the commands necessary. After this, you can use the
commands as described below.

\beginsection How To Type Malayalam

Since on most computers it is impossible to enter Malayalam directly,
Malayalam text needs to be entered in transcription. Traditionally,
Western scholars have used a transcription with various accents, like
$$.d$$, $$sh$$ or~$$zh$$ to represent Malayalam characters, but even
these cannot be reproduced on most computers. To solve this
problem, \MT\ uses a
transcription that only uses the characters of the standard
ASCII character set.

The following table shows the character(s) you have to type in order
to produce a Malayalam character. The third column shows the
scientific transcription of each character.

\bigskip
\input mmtrans
\bigskip

Malayalam text can only be entered when in {\it Malayalam mode}.
Malayalam mode starts and ends with a {\tt\dollar}-sign.

Punctuation marks can be typed in Malayalam the same way as in English.
They will show up as expected. A nice ornamental star
\ornstar\ can be produced with {\tt\bslash ornstar}.

Figures in Malayalam mode will appear as
European figures. If you want Malayalam figures, you will have to
say {\tt\bslash mmfigures} first. After that {\tt 1234567890} will
appear as $\mmfigures 1234567890\rmfigures$. To switch back to
European figures, say {\tt\bslash rmfigures}.

More precise control over the formation of ligatures can be reached with
the characters {\tt >>} and {\tt<<}. {\tt >>} will
prevent the formation of a ligature, and a virama will be used between
the consonants instead. {\tt<<} will force the
pre-processor to use the secondary variant for the following
character. This can be used to show vowel-signs or secondary letters
on themselves. {\tt []} will produce a dotted circle $[]$, to make
tables like the above, and, last but not least, {\tt >} will
disambiguate the transcription if needed.

The cillu letters ($k, .n, t, n$, and $r$) will be
used automatically at the end of words, as well as anusvaram ($m$).
If a full letter with candrakala is desired, you should
place {\tt <<+} after the final letter, e.g. {\tt t<<+} yields
$t<<+$ and {\tt m<<+} yields $m<<+$.

The usage of the {\tt\dollar}-sign by \MT\ overrides its normal
meaning in
\TeX. To enter and leave normal math-mode, you will have to type
{\tt\bslash math}, for display math you just say {\tt\bslash Math}.
The \dollar-sign itself is produced by {\tt\bslash dollar}.

\beginsection Malayalam transcription

Malayalam Text can also be printed in scientific transcription.
When you want a Malayalam passage to appear in scientific
transcription, you have to switch to {\it Malayalam-transcription
mode}, which is started and ended with {\tt\dollar\dollar}. The
transcription used follows, but for a few exceptions, the
standardized transcription of the National Library in Calcutta.

If you want to use a capital letter in Malayalam-transcription mode,
you can precede the letter with a {\tt\char"5E}. This will be ignored
in Malayalam mode. If the need may arise to typeset a whole passage
of transcribed Malayalam in capital letters, the trick can be done
by enclosing it between  {\tt\char"5E\char"5E} and
{\tt\char"5E\char"5E}.

\beginsection Choosing Fonts

With \MT\ you can use, as in English, several font-styles:
regular, {\sl slanted}, and {\bf bold}. There is no {\it italic},
since italic fonts, which have a different design are unknown in
Malayalam typography, but the font is available in two flavours, the
normal style, using the same line thickness every where in the
character, and a `calligraphic' version, which shows differences in
line thickness in the character, as if it was written with a
calligraphic pen. Of course, the fonts are provided in several sizes:
6, 8, 10, 12, and 17~points high.

Every style and size is given a macro, which you have to enter to use
a certain style and size. For example, if you want to use 12pt
Malayalam calligraphic slanted, you say {\tt\bslash twelvemmcsl}. If
you use it in normal mode, the font-change will be in effect the next
time you switch to Malayalam mode, in Malayalam mode, it works
immediately.

Available fonts are:

{\bigskip\tt\def\\{\bslash}
\settabs6\columns
\+\\sixmmr      & \\eightmmr    \cr
\+\\mmr         & \\mmsl        & \\mmb         & \\mmc         & \\mmcsl       & \\mmcb        \cr
\+\\twelvemmr   & \\twelvemmsl  & \\twelvemmb   & \\twelvemmc   &\\twelvemmcsl  & \\twelvemmcb  \cr
\+\\seventeenmmr& \\seventeenmmb& \\seventeenmmc& \\seventeenmmcb\cr
}\bigskip

A sample of each font-style appears in the Appendix.

\beginsection {\twelvebf Using the Pre-Processor}

When you have finished typing (a part of) your document, you cannot
feed it to \TeX\ immediately. First you have to run it trough the
pre-processor, which will replace the Malayalam in transcription you
entered with instructions for \TeX\ to typeset the correct glyphs. The
pre-processor takes care of placing the vowel-signs around
consonants, and using the correct conjuncts for consonants without
intervening vowels.

To pre-process you document, you type:
\medskip
{\tt ml} {\it input-file output-file}
\medskip
This will process the file for traditional script. If you want to use
the nowadays normal reformed script, say:
\medskip
{\tt mlr} {\it input-file output-file}
\medskip

Actually, the commands {\tt ml} and {\tt mlr} are two small command
files, which call two programs with various parameters that do the
actual pre-processing. The first is called {\tt patc}, which takes
care of Malayalam-transcription mode, the second is {\tt mm} which
task it is to do the contextual analysis for the Malayalam script.
If you don't use Malayalam transcription in your document, you can
run only {\tt mm} to save some time.

\beginsection {\twelvebf Advanced Topics}

This part of this guide explains how to use the components of
\MT\ separately, and how to modify its tables, for
example to change the transcription it understands, or to change the
way it composes conjuncts. It should be read carefully, and care
should be taken when you tamper with the tables, since several tables
depend on each other in delicate ways. If you want to change the
transcription only, the best way is to use Patc to translate your
transcription to the standard transcription. To show you how this
can be accomplished, I have include the file {\tt ack.pat}, that
translates the transcription used on the {\tt alt.culture.kerala} newsgroup
to the transcription used with {\tt mm}, assuming that Malayalam text
is delimited with {\tt\dollar} in the source already (If they are
missing, you should place them manually; it is a non-trivial
task to have a computer automatically recognize Malayalam passages in
English text). With this file, you can convert texts in this
transcription by giving the command:

\medskip
{\tt patc -p ack.pat {\it input-file output-file}}
\medskip

\beginsection Patc

Patc is a program that can translate patterns occurring in a input file
to other patterns in the output file. It is fully table driven, and
both the patterns it reads as well as those it outputs are defined in
tables or {\it pattern-files}. It is an ideal tool to switch from one
transcription scheme to another. Within the \MT\ package it
is used to translate the easy-to-type transcription of Malayalam I
adopted into a sequence of \TeX-commands that will produce scientific
transcription. The transcription it reads and the commands it outputs
are given in a pattern-file called {\tt mm.pat}.

Patc should be called as follows:

\medskip
{\tt patc [-v] -p {\it pattern-file input-file output-file}}
\medskip

The {\tt -v} option tells {\tt patc} to be verbose, and the {\tt -p}
option tells it that the next parameter given is the name of a
pattern file. The last two
parameters tells it to read from {\it input-file} and to write to
{\it output-file}. The actual format of a pattern-file
is described in the documentation that comes with {\tt patc}. (Read
this first, the following sections assume knowledge of its contents)

\beginsection mm

{\tt mm} is the `actual' pre-processor, it translates the Roman transcription into Malayalam
script. It uses the correct shapes for vowels depending on whether they
appear initially or after a consonant, and selects the correct
conjuncts. This program, too, is table driven.

{\tt mm} is called by:

\medskip
{\tt mm [-{\it option}] [-t {\it transcription-file}] [-s {\it script-file}] {\it input-file} [{\it output-file}]}
\medskip

Available options are {\tt-v}, {\tt-V}, and {\tt-h}.
The {\tt -v} option tells {\tt mm} to be verbose, if given,
the pre-processor will inform you about files read.
if you give the {\tt-V} option instead, it will also print
a~{\tt.}~for every syllable output, and a {\tt+} every time it is forced
to use a virama instead of a conjunct. When {\tt-h} is given, {\tt mm}
will do nothing but print a help message.

The {\tt-t} option tells {\tt mm} to read the {\it transcription definition} from
the file given in the next parameter. The transcription definition defines which
Roman characters are used to transcribe Malayalam characters. If it is omitted,
{\tt mm} will use {\tt mmr.trs}.
The {\tt-s} option tells {\tt mm} to read the {\it script definition} from the
file given in the next parameter. The script definition defines which glyphs from the
font are to be used to represent Malayalam characters in various
contexts. If it is omitted, {\tt mm} will use {\tt mmr.scr}, which
defines reformed script.

The last two parameters tell {\tt mm} where to read its input from and
where to put its output. Default, the name of the input file ends with
{\tt.mm} and the name of the output file with {\tt.tex}.
If the name of the output file is omitted, {\tt mm}
will construct it from the input file name by replacing the extension
of it with {\tt.tex}.

{\tt mm} will look for it's transcription and script files in the
current directory first, and then in the directory pointed at by the
environment variable {\tt MMDIR}.

\beginsection Transcription Files

As stated above, a transcription definition tells the preprocessor
how to interprete an input-file. It not only tells it which sequence
of Roman characters stands for which Malayalam characters, but also how to
separate Malayalam text from English text, which the pre-processor
should leave untouched, and also tells the pre-processor how to
recognize \TeX-commands (in a limited way) and comments --~which it
strips from the input-file.

A transcription definition is given in a {\it transcription file}.
The general structure of a transcription file is the same as that of a patc
file. Inside a transcription file, the following {\tt\@}-commands can
occur: {\tt\@atbegin}, {\tt\@atend}, {\tt\@table}, and {\tt\@end}.

{\tt\@atbegin} defines which patterns will start
and {\tt\@atend} defines which patterns that will end Malayalam mode.
You can give several patterns, in double quotes, on the same line as the
command is. A quick glance in {\tt mm.trs} will learn you that, apart
from the {\tt\dollar}-sign, you can also use
{\tt<{}malayalam>} to start Malayalam and {\tt<{}/malayalam>} to end it.
Further, {\tt<{}mlr>} and {\tt<{}/mlr>} are provided to
delimit reformed script, while {\tt<{}ml>} and
{\tt<{}/ml>} delimit traditional script, so that you can use both
in the same document, in which case you will have to run the pre-processor
twice on the input-file. These delimiters are provided, in case
you want to be more clear about the language used, or want to use the
{\tt\dollar}-sign for some other purpose. Imagine writing a book about
the relationships between Dravidian languages, in which most of the
examples are from Tamil, I guess you would prefer to reserve the
{\tt\dollar}-signs for Tamil then (but in that case you will have to
remove them in the current transcription files).

{\tt\@table} starts the table of patterns that are used for
transcribing Malayalam characters. Each following non-empty line until
the next {\tt\@}-command is considered to be an entry in the table. The
format is basically the same as that of the {\tt\@patterns}-tables of
patc, but you may not use pattern-set switching, and an extra action,
{\tt=} is added. This action maps a transcription pattern to an
internal code. Extreme care is required when changing these codes,
since they are hardwired into the pre-processor, that knows that some
of them are consonants, and others vowels, and uses that knowledge to
perform its task. Also, the same codes are used in the script
definition to identify characters. The codes should match in
the transcription-table, internally in the pre-processor and in the
script-file.

Finally, {\tt\@end} tells the preprocessor the transcription file has
ended. It will not try the parse the rest, but close immediately after
reading this command. If a file ends before the {\tt\@end} command is
seen, the pre-processor will complain, but that is nothing to bother
about.

\beginsection Script Files

A script files contain a script-definition. A script definition tells the
pre-processor how to place graphical elements to represent a string of
characters. Because the output of the pre-processor is fed to \TeX\
for actual typesetting, the script file contains \TeX-commands to
typeset those graphical elements, to place them on top or below of
another, etc. The general structure of a script file is the same as
that of a transcription file, but, since scripts can be quite
complicated, it can (and will) contain much more commands. In a script
file you will find the following commands: {\tt \@malayalam,
\@atbegin, \@atend, \@atbeginsyllabe, \@atendsyllabe, \@prebuild,
\@primary, \@secondary, \@reepham{\rm, and} \@end}.

The {\tt\@malayalam} command tells the pre-processor that it is
dealing with Malayalam script. It must be given as the first command
in a script file. At this time the pre-processor does not understand
any other script, but if it will in future, it will be functional,
since pre-processor needs to know which script it is dealing with,
since not all peculiarities of Malayalam script are expressed in
general mechanisms defined in a script file.

{\tt\@atbegin} defines the sequence that is output every time the
pre-processor enters Malayalam mode. At this time the file {\tt
mm.scr} it contains a begingroup brace and a \TeX-command that selects
the current Malayalam font.

{\tt\@atend} defines the sequence that is output every time the
pre-processor leaves Malayalam mode, currently only a endgroup brace.

{\tt\@atbeginsyllabe} and {\tt @atendsyllabe} define the sequences
that are output at the begin respectively the end of every syllable. In
{\tt mm.scr} you will find commands that make a separate h-box of
every syllable.

{\tt\@prebuild} starts a table that defines a sequence of
\TeX-commands for each character and for sequences of characters for
which the general construction method will fail. Each non-empty line
of the table describes how to typeset a sequence of one or more
characters. The first element of the line is the character sequence in
the character string, the second element the sequence of \TeX-commands
that will produce its graphical representation. If the pre-processor
encounters a single character for which no way of typesetting it is
given in this table, it will complain, and forget the character.

{\tt\@primary} starts a table that defines the \TeX-commands for each
character and for sequences of characters when they occur at the start
of a syllable. Every entry in this table contains three elements. The
first is the character-sequence, the second the \TeX-commands that
will be placed in front of the syllable, the third the \TeX-commands
that will be placed after it. In {\tt mm.scr} this table is very
short, since Malayalam script does not modify the first letters of a
syllable (as in Devanagari), but the last ones. The only entry
describes the reepham character.

{\tt\@secondary} starts a table that defines the \TeX-commands for each
character and for sequences of characters when they occur at the end
of a syllable. The table has the same format as the {\tt\@primary}
table, but in {\tt mm.scr} it is much longer, since it defines the
glyphs for all the vowel-signs, and for the secondary variants of
$ya$, $ra$, $la$, and $va$.

{\tt\@reepham} tells the pre-processor that a traditional style
reepham is used: a little upright stroke centered above the
consonant (cluster). This command is needed because otherwise, the
pre-processor will center the reepham, incorrectly, above the whole
syllable.

\beginsection Macros defined by \MT

The traditional Malayalam script is so complicated, that it was impossible
to fit all needed glyphs into a single \TeX-font. Therefore, a Malayalam
font consists of two physical fonts, one with characters at normal size,
called the {\it base-font}, and
one with smaller sized characters, called the {\it sub-font}, that can be
used to build conjunct characters on the fly.

One can be tempted to use a normal font for a smaller size for this purpose,
but that wouldn't work out as nice, since smaller sized fonts are
normally also drawn with thinner lines, while the sub-font is drawn with
exactly the same pen as the base-font --~and also some other parameters
are set in such a way that composing conjuncts will work fine.

The pre-processor uses a macro ({\tt\bslash Z}) to switch to the sub-font,
if a glyph from that font is needed. It is not aware of the current style used.
This means that {\tt\bslash Z} has to be redefined to select the correct
sub-font, depending on current style. This is done behind the scenes when
you select a font style.

The macro that selects a font style, sets the base-font, the sub-font, and
a corresponding roman font from with several punctuation marks are borrowed, and,
when in Malayalam mode, makes the base-font current, otherwise the base-font
is made current when Malayalam mode is entered.
For a font styles in Malayalam three fonts need to be loaded in as follows:

\bigskip

\settabs\+{\tt XfontXtwelvemmfXmm12sXXXXXXX}&second\cr
{\def\\{\bslash}
\+{\tt\\font\\twelvemmf=mm12}   & load the base-font\cr
\+{\tt\\font\\twelvemmsf=mmz12} & load the sub-font\cr
\+{\tt\\font\\twelverm=cmr12}   & load the roman font for punctuation marks\cr
}

\bigskip

An example of a macro to select a style is

\bigskip

{\def\\{\bslash}\def\{{\char"7B}\def\}{\char"7D}\def\perc{\char"25}\tt
\+\\def\\twelvemmr\{\perc           & {\rm to select {\tt\\twelvemmr}:}  \cr
\+\quad\\let\\mmcurf=\\twelvemmf    & {\rm define the current base-font,} \cr
\+\quad\\let\\mmcursf=\\twelvemmsf  & {\rm define the current sub-font,}  \cr
\+\quad\\let\\mmcurrm=\\twelverm    & {\rm define the current roman font,}\cr
\+\quad\\mmcbls=15.6pt              & {\rm set the current baselineskip,} \cr
\+\quad\\ifmmmode\\setmm\\fi\}      & {\rm and if we are in Malayalam mode select it.}\cr
}

\bigskip

If you wish to include more styles, you should define new font selection
macro's following this example. The baselineskip should be larger than
for roman text, since Malayalam script tends to have taller characters.

\bigskip

The \TeX-macros given in {\tt mm.scr} to compose glyphs are all
one-letter macros.
They are defined in the file {\tt mmmacs.tex}.  Care is taken that they
do not redefine standard \TeX\ macros, and you should not redefine
them in your document. They are the following:

\bigskip

{\tt\bslash<\#1>}: typeset glyph number {\tt\#1} from the current font.

{\tt\bslash B\#1\#2}: put {\tt\#2} centered below {\tt\#1}. This is used,
for example, to build <ml>zhu</ml> from <ml>zha</ml> and
<ml>{}<<u</ml> in traditional script.

{\tt\bslash M\#1\#2}: put {\tt\#2} right below {\tt\#1}. This is used to
build, for example, to build $pla$ from $pa$ and ${}<<la$. Note that if the subscribed character is
wider than the character it is subscribed to, the width of the resulting box
will be adjusted. This happens when <ml>pra</ml> is build from <ml>pa</ml>
and <ml>{}<<ra</ml>.

{\tt\bslash T\#1\#2}: put {\tt\#1} centered on top of {\tt\#2}. This is
used to position the reepham stroke in traditional script.

{\tt\bslash Z}: switch to the subfont, the font that contains the
somewhat smaller glyphs that are subscribed to characters.

{\tt\bslash R\#1\#2}: decrease the height of box {\tt\#2} by {\tt\#1}.

{\tt\bslash K\#1}: kern {\tt\#1} em.

{\tt\bslash X\#1}: equivalent to {\tt\bslash hbox\#1}.

%%%%%%%

\input tamil.tex

\input dng.tex

\bye

%%%%%% end of mmguide.txt
