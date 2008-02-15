% mmexp.mm --- Malayalam experimental font style samples
% Copyright 1993, 1998 Jeroen Hellingman
% Last edit: 07-FEB-1993, 04-MAY-1998

\input mmqmacs
\input mmtrmacs
\input mmxfont

\font\logo=logo10
\def\MF{{\logo METAFONT}}
\parindent=0pt

This file shows some more `experimental' settings of the parameters for
\MF. You can define your own experimental fonts by copying one of the
parameter files to your own file, and change the following parameters
--~the values below come from {\tt mmc10.mf}:

\bigskip

{\tt\settabs\+font\_identifier := & 0.8333mm\#;andmore & \cr

\+ht\# :=       & 1.667mm\#;    & {\rm height of normal characters.}\cr
\+u\#  :=       & 0.8333mm\#;   & {\rm unit width (0.5 ht).}\cr
\+rm\# :=       & 0.5mm\#;      & {\rm space in between characters.}\cr
\+slant :=      & 0;            & {\rm slant of characters.}\cr

\medskip

\+rot :=        & 45;           & {\rm angle of pen.}\cr
\+thick\# :=    & 0.75pt\#;     & {\rm thickness of thickest lines.}\cr
\+thin\# :=     & 0.333pt\#;    & {\rm thickness of thinnest lines.}\cr
\+subthick\# := & 0.550pt\#;    & {\rm thickness of thickest lines in subscribed characters.}\cr

\medskip

\+font\_size := & 10pt\#;       & {\rm font size as seen by \TeX.}\cr
\+font\_identifier := & "MMC10"; & {\rm font identifier.}\cr
}

\bigskip

{\parindent=-25pt\leftskip=25pt\overfullrule=0pt\raggedright
{\xamm\mmcurrm Malayalam Experimental A 12pt: $muunnu sa.mvatsara"n"na.l+>>kkaka.m oru maryyaadasvan
oru saak.saat pookkiri aayibhaviccatu enikku boodhippaan vahiyaa.\smallskip$}
{\xbmm\mmcurrm Malayalam Experimental B 12pt: $muunnu sa.mvatsara"n"na.l+>>kkaka.m oru maryyaadasvan
oru saak.saat pookkiri aayibhaviccatu enikku boodhippaan vahiyaa.\smallskip$}
{\xcmm\mmcurrm Malayalam Experimental C 12pt: $muunnu sa.mvatsara"n"na.l+>>kkaka.m oru maryyaadasvan
oru saak.saat pookkiri aayibhaviccatu enikku boodhippaan vahiyaa.\smallskip$}

{\bigmmr\mmcurrm Malayalam Big 21pt:  $muunnu sa.mvatsara"n"na.l+>>kkaka.m oru maryyaadasvan
oru saak.saat pookkiri aayibhaviccatu enikku boodhippaan vahiyaa.\smallskip$}
{\bigmmo\mmcurrm Malayalam Big Outline Shadow 21pt: $muunnu sa.mvatsara"n"na.l+>>kkaka.m oru maryyaadasvan
oru saak.saat pookkiri aayibhaviccatu enikku boodhippaan\smallskip$}
{\hugemmr\mmcurrm Malayalam Huge 36pt:  $muunnu sa.mvatsara"n"na.l+>>kkaka.m\smallskip$}
}

%%%%%% end of mmexp.txt
