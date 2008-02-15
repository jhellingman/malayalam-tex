# compiler
CC = c:/emx/bin/gcc
# include directory
INCLUDE =-Ic:/emx/include

objects = mm.o readfile.o trs.o scr.o pstree.o avltree.o

mm.exe: $(objects)
    $(CC) -o mm.exe $(objects)

# file dependencies:
mm.o              :   mm.h trs.h scr.h readfile.h
readfile.o        :   readfile.h
trs.o             :   trs.h readfile.h mm.h
scr.o             :   scr.h readfile.h mm.h
pstree.o          :   pstree.h
avltree.o         :   avltree.h
# end
