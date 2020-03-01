%{
 #include<stdio.h>
int vowels =0;
int cons = 0;
%}

%%
[aeiouAEIOU] {vowels++;}
[a-zA-Z] { cons++; }
%%

int yywrap()
{
return 1;
}

int main()
{
printf("Enter the string : ");
yylex();
printf("Vowels = %d\nConsonants = %d",vowels,cons);
return 0;
}
