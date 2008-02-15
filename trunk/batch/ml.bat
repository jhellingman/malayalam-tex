echo process TeX file for Malayalam traditional script
patc -v -p mm.pat %1 mm.tmp
mm -v -t mm.trs -s mm.scr mm.tmp %2
del mm.tmp
