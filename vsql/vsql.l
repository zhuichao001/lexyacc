%{
#include <stdio.h>
#include "vsql.tab.h"
extern int yylval;
%}

hex             [0-9A-Fa-f]
letter          [a-zA-Z_.]
digit           [0-9]
mixchar         [a-zA-Z_0-9.]
char            [\]\[\\\+\"=\)\(\{\}\*&\^\%\$#@!:;,\|\~\`\.\<\>\?\/a-zA-Z_0-9 \t\n\-]
sign            [\+\-]
space           [ \t\n]
blank           [ \t]
quot            \'
double_quot     \"
non_double_quot [^\"\n]
back_quot       \`
other .

%%
select                  return SELECT;
SELECT                  return SELECT;
from                    return FROM;
FROM                    return FROM;
where                   return WHERE;
WHERE                   return WHERE;
and                     return AND;
AND                     return AND;
or                      return OR;
OR                      return OR;
[*]                     return *yytext;
[,]                     return *yytext;
[=]                     return *yytext;
`?{letter}{mixchar}*`?  return NAME;
{digit}+                return IVALUE;
\"{char}*\"             return SVALUE;
\n                      return *yytext;
[ \t]+                  /*ignore whitespace*/;
%%
