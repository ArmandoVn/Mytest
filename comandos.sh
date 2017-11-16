#!/bin/bash
flex lexico.l
gcc lex.yy.c -lfl -o salida