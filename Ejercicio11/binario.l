%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>

int nbin = 0;

/* Convierte una cadena binaria a su valor decimal */
long long bin_a_dec(const char *bin)
{
    long long dec = 0;
    while (*bin) {
        dec = (dec << 1) + (*bin - '0');
        bin++;
    }
    return dec;
}
%}

BINARIO   [01]+

%%
{BINARIO}                { nbin++; printf("BINARIO       -> %s (Decimal: %lld)\n", yytext, bin_a_dec(yytext)); }
[0-9]+                   { printf("NUMERO NO BIN -> %s (contiene digitos fuera de 0 y 1)\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFICADOR -> %s\n", yytext); }
[ \t\n]+                 ;   /* ignorar espacios y saltos */
.                        { printf("OTRO SIMBOLO  -> %s\n", yytext); }
%%

int main()
{
    yylex();
    printf("\nTotal numeros binarios reconocidos: %d\n", nbin);
    return 0;
}
