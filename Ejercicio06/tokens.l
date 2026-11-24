%option noyywrap
%{
#include <stdio.h>
int nres = 0, nid = 0, nnum = 0;   // contadores por tipo de token
%}
DIGITO   [0-9]
LETRA    [a-zA-Z_]
%%
"if"|"else"|"while"|"int"     { nres++; printf("PALABRA RESERVADA -> %s\n", yytext); }
{LETRA}({LETRA}|{DIGITO})*    { nid++;  printf("IDENTIFICADOR     -> %s\n", yytext); }
{DIGITO}+                     { nnum++; printf("NUMERO ENTERO     -> %s\n", yytext); }
[ \t\n]+                      ;   /* espacios se ignoran */
.                             { printf("OTRO SIMBOLO      -> %s\n", yytext); }
%%
int main()
{
    yylex();
    printf("\nReservadas: %d  Identificadores: %d  Enteros: %d\n", nres, nid, nnum);
    return 0;
}
