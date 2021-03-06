% tm2tex.pat -- patterns for tamil.
% Copyright 1992, 1995, 1997 Jeroen Hellingman
%
% History:
%	29-OCT-1997 updated again (JH)
%   23-NOV-1995 updated for new transcription scheme (JH)
%   22-DEC-1992 file started
%
% transliteration scheme:
%
% <tm>
% a (aa A) i (ii I) u (uu U) e (ee E) ai o (oo O) au (.k .h)
% ka "na ca ~na .ta .na ta na pa ma ya ra la va zha _n .ra
% ja .sa sa ha k.sa
% </tm>

@patterns 0
"<tm>"       	1 "\\begintamil{}"
"</tm>"     	e "</tm> found in roman-mode"
"\t"            p " "
"\\"            t                   % copy a tex command
"%"             s                   % skip comment

@rpatterns 1
"<tm>"       	e "<tm> found in tamil-mode"
"</tm>"	      	0 "\\endtamil{}"
"\\"            t                   % copy a tex command
"%"             s                   % skip comment

%%%%%%% interpunction

" "             p " "
"\t"            p " "
"\n"            p "\n"
"."             p "{\\rm.}"
","             p "{\\rm,}"
":"             p "{\\rm:}"
";"             p "{\\rm;}"
"?"             p "{\\rm?}"
"!"             p "{\\rm!}"
"("             p "{\\rm(}"
")"             p "{\\rm)}"
"`"             p "{\\rm`}"
"``"            p "{\\rm``}"
"'"             p "{\\rm'}"
"''"            p "{\\rm''}"
"-"             p "{\\rm-}"
"--"            p "{\\rm--}"
"---"           p "{\\rm---}"

%%%%%%% vowels

"a"             p "{\\TMa}"
"aa"            p "{\\TMaa}"
"A"             p "{\\TMaa}"
"i"             p "{\\TMi}"
"ii"            p "{\\TMii}"
"I"             p "{\\TMii}"
"u"             p "{\\TMu}"
"uu"            p "{\\TMuu}"
"U"             p "{\\TMuu}"
"e"             p "{\\TMe}"
"ee"            p "{\\TMee}"
"E"             p "{\\TMee}"
"o"             p "{\\TMo}"
"oo"            p "{\\TMoo}"
"O"             p "{\\TMoo}"
"ai"            p "{\\TMai}"
"au"            p "{\\TMau}"

".k"			p "{\\TMH}"
".h"            p "{\\TMH}"

%%%%%%% ka

"k"             p "{\\TMk}"
"ka"            p "{\\TMka}"
"kaa"           p "{\\TMkaa}"
"kA"            p "{\\TMkaa}"
"ki"            p "{\\TMki}"
"kii"           p "{\\TMkii}"
"kI"            p "{\\TMkii}"
"ku"            p "{\\TMku}"
"kuu"           p "{\\TMkuu}"
"kU"            p "{\\TMkuu}"
"ke"            p "{\\TMke}"
"kee"           p "{\\TMkee}"
"kE"            p "{\\TMkee}"
"ko"            p "{\\TMko}"
"koo"           p "{\\TMkoo}"
"kO"            p "{\\TMkoo}"
"kai"           p "{\\TMkai}"
"kau"           p "{\\TMkau}"

%%%%%%% "na

"\"n"           p "{\\TMng}"
"\"na"          p "{\\TMnga}"
"\"naa"         p "{\\TMngaa}"
"\"nA"          p "{\\TMngaa}"
"\"ni"          p "{\\TMngi}"
"\"nii"         p "{\\TMngii}"
"\"nI"          p "{\\TMngii}"
"\"nu"          p "{\\TMngu}"
"\"nuu"         p "{\\TMnguu}"
"\"nU"          p "{\\TMnguu}"
"\"ne"          p "{\\TMnge}"
"\"nee"         p "{\\TMngee}"
"\"nE"          p "{\\TMngee}"
"\"no"          p "{\\TMngo}"
"\"noo"         p "{\\TMngoo}"
"\"nO"          p "{\\TMngoo}"
"\"nai"         p "{\\TMngai}"
"\"nau"         p "{\\TMngau}"

%%%%%%% ca

"c"             p "{\\TMc}"
"ca"            p "{\\TMca}"
"caa"           p "{\\TMcaa}"
"cA"            p "{\\TMcaa}"
"ci"            p "{\\TMci}"
"cii"           p "{\\TMcii}"
"cI"            p "{\\TMcii}"
"cu"            p "{\\TMcu}"
"cuu"           p "{\\TMcuu}"
"cU"            p "{\\TMcuu}"
"ce"            p "{\\TMce}"
"cee"           p "{\\TMcee}"
"cE"            p "{\\TMcee}"
"co"            p "{\\TMco}"
"coo"           p "{\\TMcoo}"
"cO"            p "{\\TMcoo}"
"cai"           p "{\\TMcai}"
"cau"           p "{\\TMcau}"

%%%%%%% ~na

"~n"            p "{\\TMNY}"
"~na"           p "{\\TMNYa}"
"~naa"          p "{\\TMNYaa}"
"~nA"           p "{\\TMNYaa}"
"~ni"           p "{\\TMNYi}"
"~nii"          p "{\\TMNYii}"
"~nI"           p "{\\TMNYii}"
"~nu"           p "{\\TMNYu}"
"~nuu"          p "{\\TMNYuu}"
"~nU"           p "{\\TMNYuu}"
"~ne"           p "{\\TMNYe}"
"~nee"          p "{\\TMNYee}"
"~nE"           p "{\\TMNYee}"
"~no"           p "{\\TMNYo}"
"~noo"          p "{\\TMNYoo}"
"~nO"           p "{\\TMNYoo}"
"~nai"          p "{\\TMNYai}"
"~nau"          p "{\\TMNYau}"

%%%%%%% .ta

".t"            p "{\\TMT}"
".ta"           p "{\\TMTa}"
".taa"          p "{\\TMTaa}"
".tA"           p "{\\TMTaa}"
".ti"           p "{\\TMTi}"
".tii"          p "{\\TMTii}"
".tI"           p "{\\TMTii}"
".tu"           p "{\\TMTu}"
".tuu"          p "{\\TMTuu}"
".tU"           p "{\\TMTuu}"
".te"           p "{\\TMTe}"
".tee"          p "{\\TMTee}"
".tE"           p "{\\TMTee}"
".to"           p "{\\TMTo}"
".too"          p "{\\TMToo}"
".tO"           p "{\\TMToo}"
".tai"          p "{\\TMTai}"
".tau"          p "{\\TMTau}"

%%%%%%% .na

".n"                p "{\\TMNN}"
".na"           p "{\\TMNNa}"
".naa"           p "{\\TMNNaa}"
".nA"           p "{\\TMNNaa}"
".ni"           p "{\\TMNNi}"
".nii"          p "{\\TMNNii}"
".nI"           p "{\\TMNNii}"
".nu"           p "{\\TMNNu}"
".nuu"          p "{\\TMNNuu}"
".nU"           p "{\\TMNNuu}"
".ne"           p "{\\TMNNe}"
".nee"          p "{\\TMNNee}"
".nE"           p "{\\TMNNee}"
".no"           p "{\\TMNNo}"
".noo"          p "{\\TMNNoo}"
".nO"           p "{\\TMNNoo}"
".nai"          p "{\\TMNNai}"
".nau"          p "{\\TMNNau}"

%%%%%%% ta

"t"             p "{\\TMt}"
"ta"            p "{\\TMta}"
"taa"           p "{\\TMtaa}"
"tA"            p "{\\TMtaa}"
"ti"            p "{\\TMti}"
"tii"           p "{\\TMtii}"
"tI"            p "{\\TMtii}"
"tu"            p "{\\TMtu}"
"tuu"           p "{\\TMtuu}"
"tU"            p "{\\TMtuu}"
"te"            p "{\\TMte}"
"tee"           p "{\\TMtee}"
"tE"            p "{\\TMtee}"
"to"            p "{\\TMto}"
"too"           p "{\\TMtoo}"
"tO"            p "{\\TMtoo}"
"tai"           p "{\\TMtai}"
"tau"           p "{\\TMtau}"

%%%%%%% na

"n"             p "{\\TMn}"
"na"            p "{\\TMna}"
"naa"           p "{\\TMnaa}"
"nA"            p "{\\TMnaa}"
"ni"            p "{\\TMni}"
"nii"           p "{\\TMnii}"
"nI"            p "{\\TMnii}"
"nu"            p "{\\TMnu}"
"nuu"           p "{\\TMnuu}"
"nU"            p "{\\TMnuu}"
"ne"            p "{\\TMne}"
"nee"           p "{\\TMnee}"
"nE"            p "{\\TMnee}"
"no"            p "{\\TMno}"
"noo"           p "{\\TMnoo}"
"nO"            p "{\\TMnoo}"
"nai"           p "{\\TMnai}"
"nau"           p "{\\TMnau}"

%%%%%%% pa

"p"             p "{\\TMp}"
"pa"            p "{\\TMpa}"
"paa"           p "{\\TMpaa}"
"pA"            p "{\\TMpaa}"
"pi"            p "{\\TMpi}"
"pii"           p "{\\TMpii}"
"pI"            p "{\\TMpii}"
"pu"            p "{\\TMpu}"
"puu"           p "{\\TMpuu}"
"pU"            p "{\\TMpuu}"
"pe"            p "{\\TMpe}"
"pee"           p "{\\TMpee}"
"pE"            p "{\\TMpee}"
"po"            p "{\\TMpo}"
"poo"           p "{\\TMpoo}"
"pO"            p "{\\TMpoo}"
"pai"           p "{\\TMpai}"
"pau"           p "{\\TMpau}"

%%%%%%% ma

"m"             p "{\\TMm}"
"ma"            p "{\\TMma}"
"maa"           p "{\\TMmaa}"
"mA"            p "{\\TMmaa}"
"mi"            p "{\\TMmi}"
"mii"           p "{\\TMmii}"
"mI"            p "{\\TMmii}"
"mu"            p "{\\TMmu}"
"muu"           p "{\\TMmuu}"
"mU"            p "{\\TMmuu}"
"me"            p "{\\TMme}"
"mee"           p "{\\TMmee}"
"mE"            p "{\\TMmee}"
"mo"            p "{\\TMmo}"
"moo"           p "{\\TMmoo}"
"mO"            p "{\\TMmoo}"
"mai"           p "{\\TMmai}"
"mau"           p "{\\TMmau}"

%%%%%%% ya

"y"             p "{\\TMy}"
"ya"            p "{\\TMya}"
"yaa"           p "{\\TMyaa}"
"yA"            p "{\\TMyaa}"
"yi"            p "{\\TMyi}"
"yii"           p "{\\TMyii}"
"yI"            p "{\\TMyii}"
"yu"            p "{\\TMyu}"
"yuu"           p "{\\TMyuu}"
"yU"            p "{\\TMyuu}"
"ye"            p "{\\TMye}"
"yee"           p "{\\TMyee}"
"yE"            p "{\\TMyee}"
"yo"            p "{\\TMyo}"
"yoo"           p "{\\TMyoo}"
"yO"            p "{\\TMyoo}"
"yai"           p "{\\TMyai}"
"yau"           p "{\\TMyau}"

%%%%%%% ra

"r"             p "{\\TMr}"
"ra"            p "{\\TMra}"
"raa"           p "{\\TMraa}"
"rA"            p "{\\TMraa}"
"ri"            p "{\\TMri}"
"rii"           p "{\\TMrii}"
"rI"            p "{\\TMrii}"
"ru"            p "{\\TMru}"
"ruu"           p "{\\TMruu}"
"rU"            p "{\\TMruu}"
"re"            p "{\\TMre}"
"ree"           p "{\\TMree}"
"rE"            p "{\\TMree}"
"ro"            p "{\\TMro}"
"roo"           p "{\\TMroo}"
"rO"            p "{\\TMroo}"
"rai"           p "{\\TMrai}"
"rau"           p "{\\TMrau}"

%%%%%%% la

"l"             p "{\\TMl}"
"la"            p "{\\TMla}"
"laa"           p "{\\TMlaa}"
"lA"            p "{\\TMlaa}"
"li"            p "{\\TMli}"
"lii"           p "{\\TMlii}"
"lI"            p "{\\TMlii}"
"lu"            p "{\\TMlu}"
"luu"           p "{\\TMluu}"
"lU"            p "{\\TMluu}"
"le"            p "{\\TMle}"
"lee"           p "{\\TMlee}"
"lE"            p "{\\TMlee}"
"lo"            p "{\\TMlo}"
"loo"           p "{\\TMloo}"
"lO"            p "{\\TMloo}"
"lai"           p "{\\TMlai}"
"lau"           p "{\\TMlau}"

%%%%%%% va

"v"             p "{\\TMv}"
"va"            p "{\\TMva}"
"vaa"           p "{\\TMvaa}"
"vA"            p "{\\TMvaa}"
"vi"            p "{\\TMvi}"
"vii"           p "{\\TMvii}"
"vI"            p "{\\TMvii}"
"vu"            p "{\\TMvu}"
"vuu"           p "{\\TMvuu}"
"vU"            p "{\\TMvuu}"
"ve"            p "{\\TMve}"
"vee"           p "{\\TMvee}"
"vE"            p "{\\TMvee}"
"vo"            p "{\\TMvo}"
"voo"           p "{\\TMvoo}"
"vO"            p "{\\TMvoo}"
"vai"           p "{\\TMvai}"
"vau"           p "{\\TMvau}"

%%%%%%% zha

"zh"            p "{\\TMZ}"
"zha"           p "{\\TMZa}"
"zhaa"          p "{\\TMZaa}"
"zhA"           p "{\\TMZaa}"
"zhi"           p "{\\TMZi}"
"zhii"          p "{\\TMZii}"
"zhI"           p "{\\TMZii}"
"zhu"           p "{\\TMZu}"
"zhuu"          p "{\\TMZuu}"
"zhU"           p "{\\TMZuu}"
"zhe"           p "{\\TMZe}"
"zhee"          p "{\\TMZee}"
"zhE"           p "{\\TMZee}"
"zho"           p "{\\TMZo}"
"zhoo"          p "{\\TMZoo}"
"zhO"           p "{\\TMZoo}"
"zhai"          p "{\\TMZai}"
"zhau"          p "{\\TMZau}"

%%%%%%% .la

".l"            p "{\\TML}"
".la"           p "{\\TMLa}"
".laa"          p "{\\TMLaa}"
".lA"           p "{\\TMLaa}"
".li"           p "{\\TMLi}"
".lii"          p "{\\TMLii}"
".lI"           p "{\\TMLii}"
".lu"           p "{\\TMLu}"
".luu"          p "{\\TMLuu}"
".lU"           p "{\\TMLuu}"
".le"           p "{\\TMLe}"
".lee"          p "{\\TMLee}"
".lE"           p "{\\TMLee}"
".lo"           p "{\\TMLo}"
".loo"          p "{\\TMLoo}"
".lO"           p "{\\TMLoo}"
".lai"          p "{\\TMLai}"
".lau"          p "{\\TMLau}"

%%%%%%% .ra

".r"            p "{\\TMR}"
".ra"           p "{\\TMRa}"
".raa"          p "{\\TMRaa}"
".rA"           p "{\\TMRaa}"
".ri"           p "{\\TMRi}"
".rii"          p "{\\TMRii}"
".rI"           p "{\\TMRii}"
".ru"           p "{\\TMRu}"
".ruu"          p "{\\TMRuu}"
".rU"           p "{\\TMRuu}"
".re"           p "{\\TMRe}"
".ree"          p "{\\TMRee}"
".rE"           p "{\\TMRee}"
".ro"           p "{\\TMRo}"
".roo"          p "{\\TMRoo}"
".rO"           p "{\\TMRoo}"
".rai"          p "{\\TMRai}"
".rau"          p "{\\TMRau}"

%%%%%%% _na

"_n"            p "{\\TMN}"
"_na"           p "{\\TMNa}"
"_naa"          p "{\\TMNaa}"
"_nA"           p "{\\TMNaa}"
"_ni"           p "{\\TMNi}"
"_nii"          p "{\\TMNii}"
"_nI"           p "{\\TMNii}"
"_nu"           p "{\\TMNu}"
"_nuu"          p "{\\TMNuu}"
"_nU"           p "{\\TMNuu}"
"_ne"           p "{\\TMNe}"
"_nee"          p "{\\TMNee}"
"_nE"           p "{\\TMNee}"
"_no"           p "{\\TMNo}"
"_noo"          p "{\\TMNoo}"
"_nO"           p "{\\TMNoo}"
"_nai"          p "{\\TMNai}"
"_nau"          p "{\\TMNau}"

%%%%%%% .sa

".s"            p "{\\TMS}"
".sa"           p "{\\TMSa}"
".saa"          p "{\\TMSaa}"
".sA"           p "{\\TMSaa}"
".si"           p "{\\TMSi}"
".sii"          p "{\\TMSii}"
".sI"           p "{\\TMSii}"
".su"           p "{\\TMSu}"
".suu"          p "{\\TMSuu}"
".sU"           p "{\\TMSuu}"
".se"           p "{\\TMSe}"
".see"          p "{\\TMSee}"
".sE"           p "{\\TMSee}"
".so"           p "{\\TMSo}"
".soo"          p "{\\TMSoo}"
".sO"           p "{\\TMSoo}"
".sai"          p "{\\TMSai}"
".sau"          p "{\\TMSau}"

%%%%%%% sa

"s"             p "{\\TMs}"
"sa"            p "{\\TMsa}"
"saa"           p "{\\TMsaa}"
"sA"            p "{\\TMsaa}"
"si"            p "{\\TMsi}"
"sii"           p "{\\TMsii}"
"sI"            p "{\\TMsii}"
"su"            p "{\\TMsu}"
"suu"           p "{\\TMsuu}"
"sU"            p "{\\TMsuu}"
"se"            p "{\\TMse}"
"see"           p "{\\TMsee}"
"sE"            p "{\\TMsee}"
"so"            p "{\\TMso}"
"soo"           p "{\\TMsoo}"
"sO"            p "{\\TMsoo}"
"sai"           p "{\\TMsai}"
"sau"           p "{\\TMsau}"

%%%%%%% ja

"j"             p "{\\TMj}"
"ja"            p "{\\TMja}"
"jaa"           p "{\\TMjaa}"
"jA"            p "{\\TMjaa}"
"ji"            p "{\\TMji}"
"jii"           p "{\\TMjii}"
"jI"            p "{\\TMjii}"
"ju"            p "{\\TMju}"
"juu"           p "{\\TMjuu}"
"jU"            p "{\\TMjuu}"
"je"            p "{\\TMje}"
"jee"           p "{\\TMjee}"
"jE"            p "{\\TMjee}"
"jo"            p "{\\TMjo}"
"joo"           p "{\\TMjoo}"
"jO"            p "{\\TMjoo}"
"jai"           p "{\\TMjai}"
"jau"           p "{\\TMjau}"

%%%%%%% ha

"h"             p "{\\TMh}"
"ha"            p "{\\TMha}"
"haa"           p "{\\TMhaa}"
"hA"            p "{\\TMhaa}"
"hi"            p "{\\TMhi}"
"hii"           p "{\\TMhii}"
"hI"            p "{\\TMhii}"
"hu"            p "{\\TMhu}"
"huu"           p "{\\TMhuu}"
"hU"            p "{\\TMhuu}"
"he"            p "{\\TMhe}"
"hee"           p "{\\TMhee}"
"hE"            p "{\\TMhee}"
"ho"            p "{\\TMho}"
"hoo"           p "{\\TMhoo}"
"hO"            p "{\\TMhoo}"
"hai"           p "{\\TMhai}"
"hau"           p "{\\TMhau}"

%%%%%%% k.sa

"k.s"           p "{\\TMx}"
"k.sa"          p "{\\TMxa}"
"k.saa"         p "{\\TMxaa}"
"k.sA"          p "{\\TMxaa}"
"k.si"          p "{\\TMxi}"
"k.sii"         p "{\\TMxii}"
"k.sI"          p "{\\TMxii}"
"k.su"          p "{\\TMxu}"
"k.suu"         p "{\\TMxuu}"
"k.sU"          p "{\\TMxuu}"
"k.se"          p "{\\TMxe}"
"k.see"         p "{\\TMxee}"
"k.sE"          p "{\\TMxee}"
"k.so"          p "{\\TMxo}"
"k.soo"         p "{\\TMxoo}"
"k.sO"          p "{\\TMxoo}"
"k.sai"         p "{\\TMxai}"
"k.sau"         p "{\\TMxau}"

@end
