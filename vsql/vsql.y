%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token SELECT UPDATE INSERT DELETE SET FROM INTO VALUES WHERE AND OR EQ NEQ GT LT GE LE NAME VALUE
%left AND OR
%left EQ NEQ GT LT GE LE

%%

program:    get '\n'
            | post '\n'
            | put '\n'
            | del '\n'
            |;

fields:     NAME | fields ',' NAME;
columns:    '*' | fields;
values:     VALUE | values ',' VALUE;
logic:      EQ | NEQ | GT | LT | GE | LE;
whereas:    | WHERE expr;
expr:       clause | expr AND clause | expr OR clause;
clause:     NAME logic VALUE; 

assignment: NAME '=' VALUE | assignment ',' NAME '=' VALUE;

get:        SELECT columns FROM NAME whereas { printf("SELECT SQL WHERE\n"); };

post:       UPDATE NAME SET assignment whereas { printf("UPDATE SQL\n"); } ;

put:        INSERT INTO NAME '(' fields ')' VALUES '(' values ')' { printf("INSERT SQL\n"); };

del:        DELETE FROM NAME whereas { printf("DELETE SQL\n"); };

%%

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
