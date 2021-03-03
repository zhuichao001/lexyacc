%{
#include <stdio.h>
#include "sql_yacc.tab.h"
extern int yylval;
%}

word    [a-zA-Z0-9_]+
digit   [1-9][0-9]*

%%
select                      return SELECT;
SELECT                      return SELECT;
from                        return FROM;
FROM                        return FROM;
where                       return WHERE;
WHERE                       return WHERE;
and                         return AND;
AND                         return AND;
or                          return OR;
OR                          return OR;
[*]                         return *yytext;
[,]                         return *yytext;
[=]                         return *yytext;
`?[a-zA-Z_][a-zA-Z0-9_]*`?  return NAME;
{digit}                     return IVALUE;
\"{word}\"                  return SVALUE;
\n                          return *yytext;
[ \t]+                      /*ignore whitespace*/;
%%
