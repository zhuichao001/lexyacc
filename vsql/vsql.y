%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token SELECT UPDATE INSERT DELETE SET FROM INTO VALUES WHERE 
%token VALUE NAME AND OR EQ NEQ GT LT GE LE

%%

lang:       get | post | put | del ;

fields:     NAME | NAME ',' fields;
items:      '*' | fields;
values:     VALUE | VALUE ',' values;
logic:      EQ | NEQ | GT | LT | GE | LE;
condition:  NAME logic VALUE | NAME logic VALUE AND condition | NAME logic VALUE OR condition;
assignment: NAME '=' VALUE | NAME '=' VALUE ',' assignment;

get:        SELECT items FROM NAME WHERE condition '\n' { printf("SELECT SQL\n"); }
            |SELECT items FROM NAME '\n' { printf("SELECT mini SQL\n"); };

post:       UPDATE NAME SET assignment WHERE condition '\n' { printf("UPDATE SQL\n"); } 
            |UPDATE NAME SET assignment '\n' { printf("UPDATE mini SQL\n"); };

put:        INSERT INTO NAME '(' fields ')' VALUES '(' values ')' '\n' { printf("INSERT SQL\n"); };

del:        DELETE FROM NAME WHERE condition '\n' { printf("DELETE SQL\n"); }
            |DELETE FROM NAME  '\n' { printf("DELETE mini SQL \n"); };

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

