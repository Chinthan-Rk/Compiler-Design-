%{
  #include<stdio.h>
  int c=0;
%}
digit [0-9]
letter [a-zA-Z]
id {letter}({letter}|{digit})*
%%
{id} {c++;}
.+ {;}
\n {;}
%%

int main(){
printf("Enter the input");
   yylex();
   printf("No of identifiers=%d",c);
   return 0;
}

int yywrap()
{
  return 1;
}
 


