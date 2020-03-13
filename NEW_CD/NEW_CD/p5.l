%{
	#include<stdio.h>
	int pi=0,ni=0, pf=0, nf=0;
%}

%%
[-][0-9]+ {ni++;}
[+]?[0-9]+ {pi++;}
[+]?[0-9]*\.[0-9]+ {pf++;}
[-][0-9]*\.[0-9]+ {nf++;}
%%

int main(int argc, char *argv[])
{
   if(argc!=2)
   {
      printf("2 arguements must be provided\n");
      printf("Usage:<./a.out><file>\n");
      exit(0);
    }
    
    yyin=fopen(argv[1],"r");
    yylex();
    printf("No. of +ve integers: %d\nNo. of -ve integers:%d\nNo. of +ve fractions:%d\nNo. of -ve fractions: %d\n",pi,ni,pf,nf);
    return 0;
 }
 
 int yywrap()
 {
     return 1;
 }
 
   
