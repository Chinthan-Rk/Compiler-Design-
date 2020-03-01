%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}

%token NUMBER RELOP ID S NL IF

%%
s: if_stmt NL {printf("Count = %d",count);exit(0);};
 if_stmt: IF '(' cond ')' '{' if_stmt '}' {count++;}|S;
cond: x RELOP x ;
    x: ID|NUMBER;
%%

int yyerror(char *msg)
{
printf("Invalid Expressions\n");
}

int main()
{
printf("Enter the expression : ");
yyparse();
return 0;
}
