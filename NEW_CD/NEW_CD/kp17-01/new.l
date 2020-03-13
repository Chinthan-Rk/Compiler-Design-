%{
#include<stdio.h>
int cmt=0;
%}
%s COMMENT
%%
"//".*\n {cmt++;}
"/*".*"*/" {cmt++;}
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {cmt++;BEGIN 0;}
<COMMENT>.|\n {;}
.|\n {fprintf(yyout,"%s",yytext);}
%%
int main(int argc,char *argv[])
{if(argc!=3)
{printf("2 arguments must be provided");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("no of comment lines %d",cmt);
return 0;
}
int yywrap()
{return 1;
}
