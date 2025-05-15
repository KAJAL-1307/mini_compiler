calc: expr.l expr.y main.cpp
	lex expr.l
	yacc -d expr.y
	g++ -o calc y.tab.c lex.yy.c main.cpp
