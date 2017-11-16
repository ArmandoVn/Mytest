%{
	#include <stdio.h>
	extern int yylex(void);
	extern char *yytext;
	extern FILE *yyin;
	void yyerror(char *s);
%}

%union
{
	float real;
}

%start Exp

%token <real> NUMBER
%token MAS
%token MENOS
%token MULT
%token DIV

%type <real> Exp

%left MAS MENOS
%left MULT DIV

%%

Exp :   	NUMBER {$$=$1;}
           |Exp MAS Exp {$$=$1+$3; printf("%4.1f\n",$1);}
           |Exp MENOS Exp {$$=$1-$3;}
           |Exp MULT Exp {$$=$1*$3;}
           |Exp DIV Exp {$$=$1/$3;}
           ;
%%
void yyerror(char *s)
{
  printf("Error sintactico %s\n",s);
}

int main()
{
	yyin=fopen("prueba.txt","r");
	yyparse();
	return 0;
}