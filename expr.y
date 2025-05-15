%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s) {
  printf("Parse error: %s\n", s);
}
%}

%union {
  int ival;
  float fval;
  char* str;
}

%token <ival> NUMBER
%token <fval> FLOAT
%token <str> ID

%token INT FLOAT CHAR BOOL
%token PRINT SCAN
%token IF ELSE WHILE FOR
%token EQ NEQ GTE LTE GT LT ASSIGN
%token SEMICOLON LPAREN RPAREN LBRACE RBRACE
%token PLUS MINUS MUL DIV

%%

program:
    statements
    ;

statements:
    statements statement
    | statement
    ;

statement:
      declaration SEMICOLON
    | assignment SEMICOLON
    | print_call SEMICOLON
    | scan_call SEMICOLON
    | if_statement
    | loop_statement
    ;

declaration:
      INT ID
    | FLOAT ID
    | CHAR ID
    | BOOL ID
    ;

assignment:
      ID ASSIGN expr
    ;

expr:
      expr PLUS expr
    | expr MINUS expr
    | expr MUL expr
    | expr DIV expr
    | NUMBER
    | FLOAT
    | ID
    ;

print_call:
    PRINT LPAREN expr RPAREN
    ;

scan_call:
    SCAN LPAREN ID RPAREN
    ;

if_statement:
    IF LPAREN condition RPAREN block
    | IF LPAREN condition RPAREN block ELSE block
    ;

condition:
      expr EQ expr
    | expr NEQ expr
    | expr GT expr
    | expr LT expr
    | expr GTE expr
    | expr LTE expr
    ;

block:
    LBRACE statements RBRACE
    ;

loop_statement:
    WHILE LPAREN condition RPAREN block
    | FOR LPAREN assignment SEMICOLON condition SEMICOLON assignment RPAREN block
    ;

%%

int main() {
  return yyparse();
}
