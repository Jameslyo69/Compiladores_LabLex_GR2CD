%option noyywrap
%{
#include <stdio.h>

int nid = 0;
int nnum = 0;
int ncomas = 0;
int nerror = 0;
int num_linea = 1;
%}

ID       [a-zA-Z_][a-zA-Z0-9_]*
NUM      [0-9]+
REAL     [0-9]+\.[0-9]+

%%
","                      { ncomas++; printf("Linea %d | SEPARADOR     -> '%s'\n", num_linea, yytext); }
{NUM}                    { nnum++;   printf("Linea %d | NUMERO ENTERO -> %s\n", num_linea, yytext); }
{ID}                     { nid++;    printf("Linea %d | IDENTIFICADOR -> %s\n", num_linea, yytext); }
{REAL}                   { nerror++; printf("Linea %d | ERROR (token no entero/id) -> %s\n", num_linea, yytext); }
[ \t]+                   ;   /* ignorar espacios y tabuladores */
\n                       { num_linea++; }
.                        { nerror++; printf("Linea %d | ERROR (caracter invalido)  -> '%s'\n", num_linea, yytext); }
%%

int main()
{
    yylex();
    printf("\n+-----------------------------------+\n");
    printf("|       RESUMEN DE LA LISTA         |\n");
    printf("+-----------------------------------+\n");
    printf("| Identificadores reconocidos : %3d |\n", nid);
    printf("| Numeros enteros reconocidos : %3d |\n", nnum);
    printf("| Separadores de coma (,)     : %3d |\n", ncomas);
    printf("| Tokens con error reportados : %3d |\n", nerror);
    printf("+-----------------------------------+\n");
    return 0;
}
