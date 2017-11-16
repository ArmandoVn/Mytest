%{
	#include <stdio.h>
	#include "sintactico.tab.h"
	int linea = 1;
	int yylex();
%}
number 		[0-9]*
letter 		[a-z]*
empty 		[ ]*
parentesis	[\(|\)]
list 		[']*
%%
{number} 		{ECHO;}
{empty} 		{/*omitir*/}
{letter} 		{ECHO;}
"+"			{printf("OperadorSuma");}
"-"			{printf("OperadorResta");}
"*"			{printf("OperadorMulti");}
"/"			{printf("OperadorDiv");}
"'" 			{printf("Lista");}
"\n"			{printf("\n");linea++;}
{parentesis}	{printf("Parentesis");}
. 				{printf("\nERROR Lexico: <<"); ECHO; printf(">> ");
				 printf("lin: %i", linea);}
%%
main(){
	yyin = fopen("prueba.txt","r");
	yylex();
}