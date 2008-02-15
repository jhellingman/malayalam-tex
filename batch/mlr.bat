echo process TeX file for Malayalam reformed script
patc -v -p mm.pat %1 mm.tmp
mm -v -t mmr.trs -s mmr.scr mm.tmp %2
del mm.tmp
