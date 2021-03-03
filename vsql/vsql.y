%{
#include <stdio.h>
int yylex(void);
int yywrap(void);
void yyerror(char const *);
%}

%token SELECT UPDATE INSERT DELETE SET FROM INTO VALUES VALUE NAME WHERE AND OR

%%

lang: get | modify | put | del ;

fields:     NAME | NAME ',' fields;
items:      '*' | fields;
values:       VALUE | VALUE ',' values;
condition:  NAME '=' VALUE | NAME '=' VALUE AND condition | NAME '=' VALUE OR condition;
assignment: NAME '=' VALUE | NAME '=' VALUE ',' assignment;

get:        SELECT items FROM NAME '\n' { printf("SELECT mini SQL\n"); }
            |SELECT items FROM NAME WHERE condition '\n' { printf("SELECT SQL\n"); };

modify:     UPDATE NAME SET assignment '\n' { printf("UPDATE mini SQL\n"); } 
            |UPDATE NAME SET assignment WHERE condition '\n' { printf("UPDATE SQL\n"); };

put:        INSERT INTO NAME '(' fields ')' VALUES '(' values ')' '\n' { printf("INSERT SQL\n"); };

del:        DELETE FROM NAME  '\n' { printf("DELETE mini SQL \n"); }
            |DELETE FROM NAME WHERE condition '\n' { printf("DELETE SQL\n"); };

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

