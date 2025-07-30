%{
#include "cal.tab.h"
%}

%%

"do"              { return DO; }
"while"           { return WHILE; }
"("               { return LPAREN; }
")"               { return RPAREN; }
";"               { return SEMI; }
"<"               { return LT; }

[0-9]+            { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }

[ \t\n\r]+        { /* skip whitespace */ }

.                 { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
