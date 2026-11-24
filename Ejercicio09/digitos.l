%option noyywrap
%{
#include <stdio.h>
int cont[10];       // un contador para cada digito 0-9
int total = 0;
%}
%%
[0-9]    { cont[yytext[0] - '0']++; total++; }
.|\n     ;   /* lo que no es digito se ignora */
%%
int main()
{
    int i;
    yylex();
    printf("\n+--------+----------+\n");
    printf("| Digito | Cantidad |\n");
    printf("+--------+----------+\n");
    for (i = 0; i < 10; i++)
        printf("|   %d    |   %4d   |\n", i, cont[i]);
    printf("+--------+----------+\n");
    printf("| Total  |   %4d   |\n", total);
    printf("+--------+----------+\n");
    return 0;
}
