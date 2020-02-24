%{
#include<stdio.h>
%}
%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt:exp NL{printf("value=%d\n",$1);exit(0);}
;
exp:exp '+' exp {$$=$1+$3;}
	|exp '-' exp {$$=$1-$3;}
	|exp '*' exp {$$=$1*$3;}
	|exp '/' exp {if($3==0)
					{
					printf("Divide by zero");
					exit(0);
					}
					else
				$$=$1/$3;}
	|'('exp')' {$$=$2;}
	| ID {$$=$1;}
	|NUMBER {$$=$1;}
	;
%%
int yyerror(char *msg)
{
printf("Invalid input");
}
int main()
{
printf("Enter hte expression");
yyparse();

}

