%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]       { return yytext[0]; }
[ \t\n]         ;  // ignore whitespace
.               { printf("Unknown character: %s\n", yytext); }

%%
