%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token TOKNUM TOKADD TOKCR

%%
line
    : expression TOKCR
    {
        printf("%d\n", $1);
    }
expression
    : TOKNUM TOKADD TOKNUM
    {
        $$ = $1 + $3;
    }
    ;
%%

void yyerror(char const *msg){
    fprintf(stderr, "ERROR: %s\n", msg);
}

int yywrap(void){
    return 1;
}

int main(void){
    return yyparse();
}
