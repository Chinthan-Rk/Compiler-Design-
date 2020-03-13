%{
	#include<stdio.h>
	int is_simple=1;
%}

%%
[ \t\n][aA][nN][dD][ \t\n] {is_simple=0;}
[ \t\n][oO][rR][ \t\n] {is_simple=0;}
[ \t\n][bB][uU][tT][\t\n ] {is_simple=0;}
. {;}
%%

int main()
{
	printf("Enter the sentence:\n");
	yylex();
	if(is_simple==0)
	     printf("Entered sentence is a compound sentence\n");
	 else
	 	printf("Entered sentence is a simple sentence\n");
	 return 0;
}

int yywrap()
{
return 1;
}

