%{
   #include<stdio.h>
%}
%token NUMBER ID NL 
%left '+' '-'
%left '*' '/'

%%
stmt:exp NL {printf("Valid expression");
		exit(0);
	    }
;
exp:exp '+' exp
   |exp '-' exp
   |exp '*' exp
   |exp '/' exp
   |'('exp')'
   |ID
   |NUMBER
;
%%

int yyerror(char * msg)
{
   printf("Invalid expression");
}

int main()
{
   printf("Enter the expression:\n");
   yyparse();
}

