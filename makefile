all : compiler

lex.yy.c : compiler.l
	./flex compiler.l

compil.tab.c : compil.y
	~/bison/bin/bison -d -v compil.y

compiler : lex.yy.c compil.tab.c
	gcc -o compiler lex.yy.c compil.tab.c tabStruct.c tabInstruct.c libfl.a ~/bison/lib/liby.a

clean : 
	rm compil.tab.c
	rm lex.yy.c

test : compiler
	./compiler < test.c
