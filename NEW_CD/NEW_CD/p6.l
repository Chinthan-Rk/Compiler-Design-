%{
	#include<stdio.h>
	int pf=0,sf=0;
%}

%%
"printf" {fprintf(yyout,"writef");pf++;}
"scanf" {fprintf(yyout,"readf");sf++;}
%%

int main(int argc, char *argv[])
{
   if(argc!=3)
   {
      printf("3 arguements are needed\n");
      printf("Usage: <./a.out> <input file> <output file>\n");
      exit(0);
   }
   
   yyin=fopen(argv[1],"r");
   yyout=fopen(argv[2],"w");
   yylex();
   printf("No. of pf: %d\n",pf);
   printf("No. of sf: %d\n", sf);
   return 0;
}

int yywrap()
{
   return 1;
}


