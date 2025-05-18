%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s) {
  printf("Parse error: %s\n", s);
}

typedef struct {
  int ival;
  float fval;
  char* str;
} YYSTYPE;

#define YYSTYPE YYSTYPE

%}

%union {
  int ival;
  float fval;
  char* str;
}
%token INT CHAR BOOL
%token <ival> NUMBER
%token <fval> FLOAT
%token <str> ID

%token PRINT SCAN
%token IF ELSE WHILE FOR
%token EQ NEQ GTE LTE GT LT ASSIGN
%token SEMICOLON LPAREN RPAREN LBRACE RBRACE
%token PLUS MINUS MUL DIV

%type <ival> expr

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
      ID ASSIGN expr {
        // For now, just print assignment for demo
        printf("%s = %d\n", $1, $3);
      }
    ;

expr:
      expr PLUS expr { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr MUL expr { $$ = $1 * $3; }
    | expr DIV expr {
        if ($3 == 0) {
          yyerror("Division by zero");
          $$ = 0;
        } else {
          $$ = $1 / $3;
        }
      }
    | NUMBER { $$ = $1; }
    | FLOAT { $$ = (int)$1; }   // convert float to int for simplicity
    | ID { 
        // For now, just return 0 for variables (no symbol table yet)
        $$ = 0;
      }
    ;

print_call:
    PRINT LPAREN expr RPAREN {
      printf("Print: %d\n", $3);
    }
    ;

scan_call:
    SCAN LPAREN ID RPAREN {
      // For now, no actual scan implementation
      printf("Scan called for %s\n", $3);
    }
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
