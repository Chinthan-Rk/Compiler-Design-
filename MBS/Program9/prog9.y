%{
#include<stdio.h>
#include<stdlib.h>
%}

%token number id nl
%left '+''-'
%left '*''/'

%%
s : exp nl {printf("Valid expression"); exit(0);};
exp : exp '+' exp | exp '-' exp | exp '/' exp | exp '*' exp | '{' exp '}' | '(' exp ')' | id | number ;
%%

int yyerror(char *msg)
{
printf("Error");
exit(0);
}

int main()
{
printf("Enter the expression : ");
yyparse();
return 0;
}
