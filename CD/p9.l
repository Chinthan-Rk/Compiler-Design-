%{
#include<stdio.h>
int com=0;
%}
%s COMMENT
%%
"//".* {com++;}
"/*"[.]*"*/" {com++;}
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {com++;BEGIN 0;}
<COMMENT>.|\n {;} 
.|\n {fprintf(yyout,"%s",yytext);}
%%
int main (int argc,char * argv[])
{
if (argc!=3)
{
printf("2 arguements required\n");
printf("Usage:<./a.out><file>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("no. of comment lines %d",com);
return 0;
}
int yywrap()
{
return 1;
}

