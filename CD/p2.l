%{
  #include<stdio.h>
  int wc=0;
%}
chars [A-Za-z\_\'\.\"]
numbers ([0-9])+
delim [""\n\t]
whitespace {delim}+
words {chars}+
%%
{words} {wc++;}
{whitespace} {}
{numbers} {}
%%

void main()
{
printf("Enter the input:");
yylex();
printf("No. of words: %d\n",wc);
}

int yywrap()
{
return 1;
}

