%{
#include<stdio.h>
int id;
%}
%%
[a-zA-Z][a-zA-Z0-9_]* {id++;ECHO;printf("\n");}
.+ {;}
\n {;}
%%
int main (int argc,char * argv[])
{
if(argc!=2)
{
printf("2 Arguementsmust be provided");
printf("Usage :<./a.out><file>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yylex();
printf("No. of identifiers are %d",id);
return 0;
}
int yywrap()
{
return 1;
} 
