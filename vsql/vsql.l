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
char            [\-\[\]\\\+\"=\)\(\{\}\*&\^\%\$#@!:\|\~\`\.\<\>\?\/a-zA-Z_0-9 ;]
sign            [\+\-]
space           [ \t\n]
blank           [ \t]
quot            \'
big_quot        \"
non_big_quot    [^\"]
back_quot       \`
other .

%%
SELECT          return SELECT;
UPDATE          return UPDATE;
INSERT          return INSERT;
INTO            return INTO;
DELETE          return DELETE;
SET             return SET;
FROM            return FROM;
VALUES          return VALUES;
WHERE           return WHERE;
AND             return AND;
OR              return OR;
'='             return EQ;
'<>'            return NEQ;
'>'             return GT;
'<'             return LT;
'>='            return GE;
'<='            return LE;
[,]             return *yytext;
[*]             return *yytext;
[=]             return *yytext;
`?{idmark}`?    return NAME;
{digit}+        return VALUE;
\"{char}*\"     return VALUE;
\'{char}*\'     return VALUE;
[;]             return SEMI;
[\n]            return EOL;
[ \t]+        ; /*ignore white space*/
%%
