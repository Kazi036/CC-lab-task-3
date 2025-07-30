%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token WHILE ID NUMBER LT SEMI LPAREN RPAREN

%start stmt

%%

stmt:
    WHILE LPAREN condition RPAREN SEMI
    {
        printf("Parsing Khatam.\n");
    }
    ;

condition:
    ID LT expr ;

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
