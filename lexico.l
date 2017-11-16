%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "sintactico.tab.h"
	int linea = 1;
	int yylex();
%}
NUMBER 		[0-9]*
LETTER 		[a-z]*
EMPTY 		[ ]*
PARENTESIS	[\(|\)]
LIST 		[']*
%%
{NUMBER} 		{yylval.real=atoi(yytext);return(NUMBER);}
{EMPTY} 		{/*omitir*/}
{LETTER} 		{ECHO;}
"+"				{return(MAS);}
"-"				{return(MENOS);}
"*"				{return(MULT);}
"/"				{return(DIV);}
"'" 			{printf("Lista");}
"\n"			{printf("\n");linea++;}
{PARENTESIS}	{printf("Parentesis");}
. 				{printf("ERROR Lexico: <<"); ECHO; printf(">> ");
				 printf("lin: %i\t", linea);}
%%
/*main(){
	yyin = fopen("prueba.txt","r");
	yylex();
}*/