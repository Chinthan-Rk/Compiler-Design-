%{
#include<stdio.h>
#include<stdlib.h>
%}

%token SC INT CHAR SP CO ID NL

%%
S: TYPE SP LIST SC NL {printf("VALID\n");exit(0);};
 TYPE : INT | CHAR ;
LIST : LIST SP CO SP ID | LIST CO ID | ID ;
%%

int yyerror(char *msg)
{
printf("INVALID\n");
}

int main()
{
printf("Enter the identifier : ");
yyparse();
return 0;
}
