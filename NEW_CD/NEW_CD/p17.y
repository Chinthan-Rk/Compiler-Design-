%{
#include<stdio.h>
int c=0;
%}

%token IF RELOP S NUMBER ID

%%
stmt:if_stmt {printf("No. of nested if statements: %d\n",c);
		exit(0);
		}
	;

if_stmt: IF'('cond')'if_stmt {c++;}
	|S;
	;

cond:x RELOP x
	;

x:ID
  |NUMBER
  ;
%%

int yyerror(char *msg)
{
   printf("Incorrect input\n");
   exit(0);
}

int main()
{
   printf("Enter the statement:\n");
   yyparse();
}

