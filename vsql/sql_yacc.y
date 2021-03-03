%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token SELECT FROM NAME WHERE AND OR VALUE

%%

lang: select items using condition '\n' { printf("Syntax Correct\n"); };
select: SELECT;
items: '*' | identifiers;
identifiers: NAME | NAME ',' identifiers;
using: FROM NAME WHERE;
condition: NAME '=' VALUE 
         | NAME '=' VALUE AND condition 
         | NAME '=' VALUE OR condition;

%%

#include <stdio.h>

void yyerror (const char *str) {
    fprintf(stderr, "error: %s\n", str);
}

int yywrap() {
    return 1;
}

int main() {
    yyparse();
    return 0;
}

