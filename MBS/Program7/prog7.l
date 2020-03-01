%{
#include<stdio.h>
int isSimple=1;
%}

%%
[ \t\n]+[aA][nN][dD] {isSimple =0;}
[ \t\n]+[bB][uU][tT] {isSimple =0;}
[ \t\n]+[oO][rR] {isSimple =0;}
%%

int yywrap()
{
return 1;
}

int main()
{
printf("Enter the string : ");
yylex();
if(!isSimple)
printf("Sentence is compound");
else
printf("Sentence is simple");
return 0;
}
