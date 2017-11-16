%{
	#include <stdio.h>
	extern int yylex(void);
	extern char *yytext;
	extern int linea = 1;
	extern FILE *yyin;
	void yyerror(char *s);
%}

%union
{
	float real;
}