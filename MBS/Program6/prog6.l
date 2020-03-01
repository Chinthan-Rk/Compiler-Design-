%{
#include<stdio.h>
#include<string.h>
int numOperators=0,numOperands=0,valid=1,top=-1,i=0,j=0;
char operands[10][10],operators[10][10],a[10];
%}

%%

"(" {a[++top]='(';}
"{" {a[++top]='{';}
"[" {a[++top]='[';}
")"|"}"|"]" {if(a[top]!='(' || a[top]!='{' || a[top]!='[')
		{
		 valid = 0;return 0;
		}
	     else
		top--;
}
"+"|"-"|"/"|"*" {numOperators++;strcpy(operators[i],yytext);i++;}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* {numOperands++;strcpy(operands[j],yytext);j++;}

%%

int yywrap()
{
return 1;
}

int main()
{
printf("Enter the expressions : ");
yylex();

if(valid==1 && (numOperands-numOperators)==1)
{
printf("The expressions is valid \n");
printf("The operators are : ");
for(int x=0;x<i;x++)
printf("%s  ",operators[x]);

printf("The operands are : ");
for(int x=0 ;x<j;x++)
printf("%s\n",operands[x]);
}
else
{
printf("The expression is invalid");
}
return 0;
}
