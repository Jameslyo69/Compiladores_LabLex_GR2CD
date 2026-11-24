%option noyywrap
%{
#include <stdio.h>
#include <ctype.h>
int ncambios = 0;   // cuantas mayusculas se convirtieron
%}
%%
[A-Z]   { ncambios++; putchar(tolower(yytext[0])); }
.|\n    { ECHO; }   /* lo demas se copia igual */
%%
int main()
{
    yylex();
    printf("\nLetras convertidas: %d\n", ncambios);
    return 0;
}
