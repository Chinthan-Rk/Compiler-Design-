%{
  #include<stdio.h>
  int v=0, c=0;
%}
%%
[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}
. {;}
%%

void main()
{
printf("Enter the input:");
yylex();
printf("No. of vowels: %d\n",v);
printf("No. of consonents are %d\n",c);
}

int yywrap()
{
return 1;
}
 
