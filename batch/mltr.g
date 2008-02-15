echo process TeX file for Malayalam reformed and traditional script
patc -v -p d:\doc\malyalam\mmfont\preproc\mm.pat $1 mm.tmp
mm -v -t mmr.trs -s mmr.scr mm.tmp mm2.tmp
rm mm.tmp
mm -v -t mm -s mm mm2.tmp $2
rm mm2.tmp
