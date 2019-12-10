%{
	#include <stdlib.h>
	#include "parser.tab.h"
	void yyerror(char * err);
%}
%option noyywrap
%option outfile="lexer.c"

WS [ \n\t]

%%

"true"		{yylval.val = 1;return OPD;}
"false"		{yylval.val = 0;return OPD;}
"&&"		return '&';
"||"		return '|';
"!"			return '!';
"^"			return '^';
"="			return '=';
"("			return '(';
")"			return ')';
{WS}+		
.			{
				char err[100];
				sprintf(err, "Lexical Error: [%s] can't be parsed!", yytext);
				yyerror(err);
			}
%%