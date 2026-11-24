%option noyywrap
%{
#include <stdio.h>
int nvalidos = 0;
int ninvalidos = 0;
%}

USUARIO    [a-zA-Z0-9._%+-]+
DOMINIO    [a-zA-Z0-9.-]+\.[a-zA-Z]{2,}
CORREO     {USUARIO}@{DOMINIO}

%%
{CORREO}             { nvalidos++;   printf("CORREO VALIDO   -> %s\n", yytext); }
{USUARIO}@[^ \t\n]+  { ninvalidos++; printf("CORREO INVALIDO -> %s\n", yytext); }
[ \t\n]+             ;   /* ignorar espacios y saltos de linea */
[^ \t\n]+            { printf("OTRO TEXTO     -> %s\n", yytext); }
%%

int main()
{
    yylex();
    printf("\nTotal correos validos: %d  Invalidos: %d\n", nvalidos, ninvalidos);
    return 0;
}
