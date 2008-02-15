echo process TeX file for Malayalam traditional script
patc -v -p d:\doc\malyalam\mmfont\preproc\mm.pat $1 mm.tmp
mm -v -t mm -s mm mm.tmp $2
rm mm.tmp
