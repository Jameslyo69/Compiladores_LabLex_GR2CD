%{
        #include<stdlib.h>
%}
DIGITO      [0-9]
REAL        [+-]?{DIGITO}+(\.{DIGITO}+)?([Ee][+-]?{DIGITO}+)?
%%
{DIGITO}+               printf("NUMERO \n");
{REAL}                  printf("NUMERO REAL \n");
[a-zA-Z][a-zA-Z0-9]*    printf("IDENTIFICADOR \n");
%%
