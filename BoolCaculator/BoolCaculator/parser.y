%{
	#include <stdio.h>
	int yylex();
	void yyerror(char * err);
%}

%union {int val;}
%token <val> OPD
%type <val> b bexp bterm

%%
bs:bs b
|b
;
b:bexp '='					{if($1) printf("true\n");else printf("false\n");}
;
bexp:bexp '|' bterm			{$$ = $1 || $3;}
|bexp '&' bterm				{$$ = $1 && $3;}
|bexp '^' bterm				{$$ = $1 ^ $3;}
|bterm						{$$ = $1;}
;
bterm:'!' bterm				{$$ = !$2;}
|'(' bexp ')'				{$$ = $2;}
|OPD						{$$ = $1;}
;

%%

int main(){
	printf("Please input bool expression: ");
	yyparse();
	return 0;
}

void yyerror(char * err){
	printf("%s\n", err);
	system("pause");
	exit(0);
}