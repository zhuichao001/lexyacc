%{
#include <stdio.h>
#include "sum.tab.h"
extern YYSTYPE yylval;
%}

%%

"+"     return TOKADD;
"\n"    return TOKCR;
-?([1-9][0-9]*)|0 {
    int temp;
    sscanf(yytext, "%d", &yylval);
    return TOKNUM;
}
[ \t]   ;

%%
