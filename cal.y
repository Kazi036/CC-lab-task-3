%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token DO WHILE ID NUMBER SEMI LPAREN RPAREN LT

%start stmt

%%

stmt:
    DO stmt_block WHILE LPAREN condition RPAREN SEMI {
        printf("Parsing Finished\n");
    }
    ;

stmt_block:
    ID SEMI        // just a simple statement like x;
    ;

condition:
    ID LT expr
    ;

expr:
    ID
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
