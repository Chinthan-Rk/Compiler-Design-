%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER LETTER NL

%%

S : LETTER alpha NL {printf("VALID\n");exit(0);};
  alpha : LETTER alpha | NUMBER alpha | NUMBER | LETTER |  ;

%%

int yyerror(char *msg)
{
printf("INVALID");
}

int main()
{
printf("Enter the identifier : ");
yyparse();
return 0;
}
