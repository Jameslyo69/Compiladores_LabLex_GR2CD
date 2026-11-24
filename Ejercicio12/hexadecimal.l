/* 
 * Escuela Politecnica Nacional - Compiladores y Lenguajes (GR2CD)
 * Ejercicio 12: Reconocimiento de numeros hexadecimales tipo 0x1A3F
 * Autor: Alejandro Guanocunga
 */

%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>

int nhex = 0;
%}

HEXADECIMAL    0[xX][0-9a-fA-F]+

%%
{HEXADECIMAL}            { nhex++; 
                           unsigned long val = strtoul(yytext, NULL, 16);
                           printf("HEXADECIMAL  -> %s (Decimal: %lu)\n", yytext, val); 
                         }
0[xX][a-zA-Z0-9]+        { printf("HEX INVALIDO -> %s (digitos fuera de rango 0-9, A-F)\n", yytext); }
[0-9]+                   { printf("DECIMAL      -> %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFICADOR-> %s\n", yytext); }
[ \t\n]+                 ;   /* ignorar espacios */
.                        { printf("OTRO SIMBOLO -> %s\n", yytext); }
%%

int main()
{
    yylex();
    printf("\nTotal numeros hexadecimales reconocidos: %d\n", nhex);
    return 0;
}
