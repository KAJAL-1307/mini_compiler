extern "C" {
    int yyparse();
    int yylex();
    void yyerror(const char *s);
}
