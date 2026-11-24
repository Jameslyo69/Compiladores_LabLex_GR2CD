/* Ejercicio 1 Lex/Flex: clasificacion de caracteres */
%{
#include <stdio.h>
int mayus = 0, minus = 0, digitos = 0;
int espacios = 0, tabs = 0, saltos = 0, otros = 0;
%}
%%
[A-Z]   mayus++;
[a-z]   minus++;
[0-9]   digitos++;
" "     espacios++;
\t      tabs++;
\n      saltos++;
.       otros++;
%%
int main()
{
    yylex();
    printf("\n===== CLASIFICACION DE CARACTERES =====\n");
    printf("Letras mayusculas : %d\n", mayus);
    printf("Letras minusculas : %d\n", minus);
    printf("Digitos           : %d\n", digitos);
    printf("Espacios en blanco: %d (espacios=%d, tabs=%d, saltos=%d)\n",
           espacios + tabs + saltos, espacios, tabs, saltos);
    printf("Otros caracteres  : %d\n", otros);
    printf("=======================================\n");
    return 0;
}
