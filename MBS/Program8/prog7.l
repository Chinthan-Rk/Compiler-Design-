%{
#include<stdio.h>
int count=0;
%}

%%
[a-zA-Z][a-zA-Z0-9_]* {count++;ECHO;printf("\n");}
.+ {;}
\n {;}
%%

int yywrap()
{
return 1;
}

int main(int argc,char *argv[])
{
yyin = fopen(argv[1],"r");
yylex();
printf("Count : %d",count);
return 0;
}
