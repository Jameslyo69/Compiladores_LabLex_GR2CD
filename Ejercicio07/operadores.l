%option noyywrap
%{
#include <stdio.h>
int narit = 0, nrel = 0;
%}
%%
"<="    { nrel++;  printf("RELACIONAL  -> %s (menor o igual)\n", yytext); }
">="    { nrel++;  printf("RELACIONAL  -> %s (mayor o igual)\n", yytext); }
"=="    { nrel++;  printf("RELACIONAL  -> %s (igual)\n", yytext); }
"!="    { nrel++;  printf("RELACIONAL  -> %s (diferente)\n", yytext); }
"<"     { nrel++;  printf("RELACIONAL  -> %s (menor)\n", yytext); }
">"     { nrel++;  printf("RELACIONAL  -> %s (mayor)\n", yytext); }
"+"     { narit++; printf("ARITMETICO  -> %s (suma)\n", yytext); }
"-"     { narit++; printf("ARITMETICO  -> %s (resta)\n", yytext); }
"*"     { narit++; printf("ARITMETICO  -> %s (multiplicacion)\n", yytext); }
"/"     { narit++; printf("ARITMETICO  -> %s (division)\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("OPERANDO    -> %s\n", yytext); }
[0-9]+                   { printf("OPERANDO    -> %s\n", yytext); }
[ \t\n]+                 ;
.                        { printf("NO ES OPERADOR -> %s\n", yytext); }
%%
int main()
{
    yylex();
    printf("\nOperadores aritmeticos: %d  Relacionales: %d\n", narit, nrel);
    return 0;
}
