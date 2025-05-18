calc: expr.l expr.y main.cpp
	flex expr.l
	bison -d expr.y
	g++ -o calc expr.tab.c lex.yy.c main.cpp -lfl
