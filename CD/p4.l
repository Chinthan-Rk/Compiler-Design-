%{
  #include<stdio.h>
  int c=0,l=0,w=0,s=0;
%}

word [^ \t\n\.,:]+
eol [\n]
blank [ ]

%%
{word} {w++; c=c+yyleng;}
{eol} {l++;}
{blank} {s++;}
. {;}
%%

int main(int argc,char * argv[])
{
if(argc!=2)
{
   printf("2 arguements must be provided\n");
   printf("Usage: <./a.out><filename>\n");
   exit(0);
}

yyin=fopen(argv[1],"r");
yylex();
printf("No. of characters: %d\n No. of words: %d\n No. of spaces: %d\n No. of lines: %d\n", c,w,s,l);
return 0;
}

int yywrap()
{
return 1;
}


