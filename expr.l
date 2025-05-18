%{
#include "expr.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

"int"           { return INT; }
"float"         { return FLOAT; }
"char"          { return CHAR; }
"bool"          { return BOOL; }

"print"         { return PRINT; }
"scan"          { return SCAN; }

"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"for"           { return FOR; }

"=="            { return EQ; }
"!="            { return NEQ; }
">="            { return GTE; }
"<="            { return LTE; }
">"             { return GT; }
"<"             { return LT; }

"="             { return ASSIGN; }

";"             { return SEMICOLON; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }

[0-9]+\.[0-9]+  { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+          { yylval.ival = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }

[ \t\n]+        ; // Ignore whitespace

.               { printf("Unknown character: %s\n", yytext); }

%%
