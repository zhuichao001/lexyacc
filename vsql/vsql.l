%{
#include <stdio.h>
#include "vsql.tab.h"
extern int yylval;
%}

hex             [0-9A-Fa-f]
letter          [a-zA-Z_.]
digit           [0-9]
mixchar         [a-zA-Z_0-9.]
idmark          [a-zA-Z_.][a-zA-Z_0-9.]*
char            [\]\[\\\+\"=\)\(\{\}\*&\^\%\$#@!:;,\|\~\`\.\<\>\?\/a-zA-Z_0-9 \t\n\-]
sign            [\+\-]
space           [ \t\n]
blank           [ \t]
quot            \'
big_quot        \"
non_big_quot    [^\"\n]
back_quot       \`
other .

%%
SELECT          return SELECT;
FROM            return FROM;
WHERE           return WHERE;
AND             return AND;
OR              return OR;
[*]             return *yytext;
[,]             return *yytext;
[=]             return *yytext;
`?{idmark}`?    return NAME;
{digit}+        return IVALUE;
\"{char}*\"     return SVALUE;
\n              return *yytext;
[ \t]+          ; /*ignore white space*/
%%
