%{
    extern int cn,wn,ln;
%}

word    [^ \t\n]+
eol     \n

%%

{word}  { wn++; cn+=yyleng; }
{eol}   { cn++; ln++; printf("%d %d %d\n", ln, wn, cn);}
.       { cn++; }

%%

#include <stdio.h>
int cn = 0, wn = 0,ln = 0;

int main(){
    yylex();
    printf("%d %d %d\n", ln, wn, cn);
    return 0;
}

int yywrap(){
    return 0;
}
