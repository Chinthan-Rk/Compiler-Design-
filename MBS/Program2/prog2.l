%{
#include<stdio.h>
int chars =0 , words =0 , lines=0, spaces = 0;
%}


%%
[^ \t\n\.:] {words++;chars+=yyleng;}
[ ] {spaces++;}
[\n] {lines++;}
%%

int yywrap()
{
return 1;
}


int main(int argc,char *argv[])
{
yyin = fopen(argv[1],"r");
yylex();
printf("Chars : %d,Words : %d,Spaces : %d,Lines : %d",chars,words,spaces,lines);
return 0; 
}
