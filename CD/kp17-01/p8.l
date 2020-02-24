%{
    #include<stdio.h>
     int id=0;
%}

%%
[a-zA-Z][a-zA-Z0-9_].* {id++;ECHO;printf("\n");}
.+ {;}
\n {;}
%%

int main(int argc, char * argv[])
{
   if(argc!=2)
   {
	printf("2 arguements are required\n");
	printf("Usage: <./a.out><filaname>\n");
	exit(0);
   }

   yyin=fopen(argv[1],"r");
   yylex();
   printf("No. of identifiers: %d\n",id);
   return 0;
}

int yywrap()
{
   return 1;
}


	
