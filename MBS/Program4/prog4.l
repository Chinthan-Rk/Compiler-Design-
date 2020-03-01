%{
#include<stdio.h>
int clines=0;
%}

%s COM

%%
"//".* {clines++;}
"/*" {BEGIN COM;}
<COM>"*/" {BEGIN 0;clines++;}
<COM>[\n] {clines++;}
<COM>. {;}
.|\n {fprintf(yyout,"%s",yytext);} 
%%

int yywrap()
{
return 1;
}

int main(int argc,char *argv[])
{
yyin = fopen(argv[1],"r");
yyout = fopen(argv[2],"w");
yylex();
printf("Comment Lines => %d\n",clines);
return 0;
}
