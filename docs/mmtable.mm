% mmtable.mm -- table of malayaa.lam script
% Copyright 1992, 1995, 1998 Jeroen Hellingman
%
% History:
%   04-MAY-1998 updated transcription (JH)
%   23-NOV-1995 updated for new transcription scheme (JH)
%   25-DEC-1992 created (Jeroen Hellingman)

\input mmmacs
\input mmtrmacs
\input mmphmacs

\parindent=0pt

\centerline{\twelvebf Table of Malayalam letters with transcription}

\bigskip

\def\q{\quad\hfill}
\def\col#1#2{\hbox{\vtop{\hsize=#1\raggedright\tolerance=10000#2}}}
\def\malstrut{\vtop to4pt{}\vbox to10pt{}}
\halign{\malstrut\twelvemmr#\q&\twelvemmr#\q&\tt#\q&#\q&#\q&\col{4cm}{#}\q\cr
\col{1.75cm}{normal character shape}        &
\col{1.75cm}{secondary form}                &
\col{1.75cm}{\rm ASCII transcription}       &
\col{1.75cm}{scientific transcription}      &
\col{4cm}{remark}                       \cr
\noalign{\hrule}
$a$         &           & a         & $$a$$             & $$a$$ is inherent in consonants. \cr
$aa$        & $[]<<aa$  & aa        & $$aa$$        \cr
$i$         & $[]<<i$   & i         & $$i$$             \cr
$ii$        & $[]<<ii$  & ii        & $$ii$$        & older form: $.mra.m$, $.m[].m$.   \cr
$u$         & $[]<<u$   & u         & $$u$$             & irregular secundary shape.    \cr
$uu$        & $[]<<uu$  & uu        & $$uu$$        & idem.                         \cr
$R$         & $[]<<R$   & R         & $$R$$ (\r{r})     & used in Sanskrit loan words.  \cr
$RR$        & $[]<<RR$  & RR        & $$RR$$ (\r{\=r})  & only used in a few Sanskrit words. \cr
$L$         & $[]L$     & L         & $$L$$ (\r{l})     & idem.                         \cr
$LL$        & $[]LL$    & LL        & $$LL$$ (\r{\=l})  & not used in any word at all. \cr
$e$         & $[]<<e$   & e         & $$e$$             \cr
$ee$        & $[]<<ee$  & ee        & $$ee$$        \cr
$ai$        & $[]<<ai$  & ai        & $$ai$$            \cr
$o$         & $[]<<o$   & o         & $$o$$             \cr
$oo$        & $[]<<oo$  & oo        & $$oo$$        \cr
$au$        & $[]<<au$  & au        & $$au$$            & now normally written $[]<<au"$, ({\tt au"}). \cr
\noalign{\hrule}
$a.m$       & $[].m$    & a.m       & $$a.m$$ ({\mmph a\m})  & anusvara, or $mu.rakka.m$.      \cr
$a.h$       & $[].h$    & a.h       & $$a.h$$           & visarga, or $visargga.m$.      \cr
\noalign{\hrule}
$ka$        & $[]<<ka$  & ka        & $$ka$$            \cr
$kha$       &           & kha       & $$kha$$           \cr
$ga$        &           & ga        & $$ga$$            \cr
$gha$       &           & gha       & $$gha$$           \cr
$"na$       &           & "na       & $$"na$$ ({\mmph \ng a}) \cr
\noalign{\hrule}
$ca$        &           & ca        & $$ca$$ (\v ca)    \cr
$cha$       &           & cha       & $$cha$$ (\v cha)  \cr
$ja$        &           & ja        & $$ja$$ (\v\j a)   \cr
$jha$       &           & jha       & $$jha$$ (\v\j ha) \cr
$~na$       &           & \~{}na    & $$~na$$ ({\mmph\ny a})    \cr
\noalign{\hrule}
$.ta$       &           & .ta       & $$.ta$$ ({\mmph\tt a})     \cr
$.tha$      &           & .tha      & $$.tha$$ ({\mmph\tt ha})   \cr
$.da$       &           & .da       & $$.da$$ ({\mmph\dd a})     \cr
$.dha$      &           & .dha      & $$.dha$$ ({\mmph\dd ha})   \cr
$.na$       &           & .na       & $$.na$$ ({\mmph\nn a})     \cr
\noalign{\hrule}
$ta$        &           & ta        & $$ta$$        \cr
$tha$       &           & tha       & $$tha$$           \cr
$da$        &           & da        & $$da$$            \cr
$dha$       &           & dha       & $$dha$$           \cr
$na$        &           & na, ..na  & $$na, ..na$$ (\v na) \cr
\noalign{\hrule}
$pa$        &           & pa        & $$pa$$        \cr
$pha$       &           & pha, fa   & $$pha$$, $$fa$$ \cr
$ba$        &           & ba        & $$ba$$        \cr
$bha$       &           & bha       & $$bha$$       \cr
$ma$        &           & ma        & $$ma$$        \cr
\noalign{\hrule}
$ya$        & $[]<<ya$  & ya        & $$ya$$        \cr
$ra$        & $[]<<ra$  & ra        & $$ra$$        & primary shape: $r<<[]$            \cr
$.ra$       & $[]<<.ra$ & .ra, ..ta  & $$.ra$$ (\v ra, \dd ra), $$..ta$$ & $valiya .ra$, `large $$.ra$$'.     \cr
$.r.ra$     &           & .r.ra, ..t..ta & $$.r.ra$$    \cr
$la$        & $[]<<la$  & la        & $$la$$        \cr
$va$        & $[]<<va$  & va        & $$va$$        \cr
$sha$       &           & sha       & $$sha$$ (sha, {\mmph\sh a})   & $ci.riya sha$, `small $$sha$$'.    \cr
$.sa$       &           & .sa       & $$.sa$$ ({\mmph\ss a})     & $valiya .sa$, `large $$.sa$$'.      \cr
$sa$        &           & sa        & $$sa$$        \cr
$ha$        &           & ha        & $$ha$$        \cr
$.la$       &           & .la        & $$.la$$ ({\mmph\ll a})     & $valiya .la$, `large $$.la$$'.      \cr
$zha$       &           & zha       & $$zha$$ (\dd la, {\mmph\rr a}) \cr
\noalign{\hrule}
            & $[]<<+$   & +         &               & virama, or $candrakala$, `cresent'. \cr
            & $[]<<+$   & =         &               & virama (creates cillu letters)      \cr
            & $[]<<u+$  & u+        & $$u+$$ (\.u, {\mmph\u})       & half $$u+$$, or $arayukaram$. \cr
\noalign{\hrule}
$0$         &           & 0         & 0             \cr
$1$         &           & 1         & 1             \cr
$2$         &           & 2         & 2             \cr
$3$         &           & 3         & 3             \cr
$4$         &           & 4         & 4             \cr
$5$         &           & 5         & 5             \cr
$6$         &           & 6         & 6             \cr
$7$         &           & 7         & 7             \cr
$8$         &           & 8         & 8             \cr
$9$         &           & 9         & 9             \cr
\noalign{\hrule}
            &           & <<        &               & join. \cr
            &           & >>        &               & non-join. \cr
$[]$        &           & []        & $$[]$$        & dotted circle. \cr
            &           & >         &               & disambiguating character.     \cr
}

\bye
