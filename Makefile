# Mini compiler Makefile using C++ main.cpp

calc: main.cpp expr.tab.c lex.yy.c
	g++ -o calc main.cpp expr.tab.c lex.yy.c -lfl

expr.tab.c expr.tab.h: expr.y
	bison -d expr.y

lex.yy.c: expr.l
	flex expr.l

clean:
	rm -f calc expr.tab.c expr.tab.h lex.yy.c
