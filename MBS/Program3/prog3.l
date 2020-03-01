%{
#include<stdio.h>
int pInt =0 ,nInt = 0,pFrac=0,nFrac=0;
%}

%%
[-][0-9]+ {nInt++;}
[-][0-9]+[.][0-9]+ {nFrac++;}
[+]?[0-9]+ {pInt++;}
[+]?[0-9]+\.[0-9]+ {pFrac++;}
%%

int yywrap()
{
return 1;
}

int main(int argc,char *argv[])
{

yyin = fopen(argv[1],"r");
yylex();

printf("Number of : \n");
printf("Positive Integers => %d\n",pInt);
printf("Negative Integers => %d\n",nInt);
printf("Positive Fractions => %d\n",pFrac);
printf("Negative Fractions => %d\n",nInt);

return 0;
}
