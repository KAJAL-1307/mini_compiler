%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%

expr:
      expr '+' expr   { printf("%d\n", $1 + $3); }
    | expr '-' expr   { printf("%d\n", $1 - $3); }
    | expr '*' expr   { printf("%d\n", $1 * $3); }
    | expr '/' expr   { printf("%d\n", $1 / $3); }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
