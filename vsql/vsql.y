%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token SELECT UPDATE INSERT DELETE SET FROM INTO VALUES WHERE NAME VALUE SEMI EOL
%left AND OR
%nonassoc EQ NEQ GT LT GE LE

%expect 0

%%

program:    /*EMPTY*/
            | selector 
            | updater SEMI 
            | inserter SEMI 
            | deleter SEMI ;

fields:     NAME | fields ',' NAME;
columns:    '*' | fields;
values:     VALUE | values ',' VALUE;
logic:      EQ | NEQ | GT | LT | GE | LE;
whereas:    /*EMPTY*/ | WHERE expr;
expr:       clause | expr AND clause | expr OR clause;
clause:     NAME logic VALUE; 
assignment: NAME '=' VALUE | assignment ',' NAME '=' VALUE;

selector:   SELECT columns FROM NAME whereas { printf("SELECT SQL WHERE\n"); };
updater:    UPDATE NAME SET assignment whereas { printf("UPDATE SQL\n"); } ;
inserter:   INSERT INTO NAME '(' fields ')' VALUES '(' values ')' { printf("INSERT SQL\n"); };
deleter:    DELETE FROM NAME whereas { printf("DELETE SQL\n"); };

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
