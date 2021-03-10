%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token SELECT UPDATE INSERT DELETE SET FROM INTO VALUES WHERE NAME VALUE SEMI EOL
%left AND OR
%left EQ NEQ GT LT GE LE

%%

program:    get SEMI EOL
            | post SEMI EOL
            | put SEMI EOL
            | del SEMI EOL
            |;

fields:     NAME | fields ',' NAME;
columns:    '*' | fields;
values:     VALUE | values ',' VALUE;
logic:      EQ | NEQ | GT | LT | GE | LE;
whereas:    /*EMPTY*/ | WHERE expr;
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
