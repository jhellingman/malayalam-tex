echo process TeX file for Malayalam/Tamil/Devanagari
patc -v -p d:\doc\malyalam\mmfont\preproc\mm.pat $1 mm1.tmp
mm -v -t mm -s mm mm1.tmp mm2.tmp
rm mm1.tmp
mm -v -t mmr.trs -s mmr.scr mm2.tmp mm3.tmp
rm mm2.tmp
patc -v -p d:\doc\malyalam\mmfont\tamil\tamil.pat mm3.tmp mm4.tmp
rm mm3.tmp
patc -v -p d:\doc\malyalam\mmfont\dng\dng.pat mm4.tmp mm5.tmp
rm mm4.tmp
echo devnag mm5.tmp $2
devnag mm5.tmp $2
rm mm5.tmp
echo well, that's done...
