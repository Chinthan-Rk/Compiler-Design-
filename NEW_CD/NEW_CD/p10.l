%{
#include<stdio.h>
#include<string.h>
int operator=0,operand=0,top=-1,valid=1,l=0,j=0;
char a[10],opnd[10][10],oprt[10][10];
%}

%%
"(" {top++;a[top]='(';}
"{" {top++;a[top]='{';}
"[" {top++;a[top]='[';}
")" {if(a[top]!='(')
	{
		valid=0;
		return 0;
	}
	else
		top--;
    }
"]" {if(a[top]!='[')
	{
		valid=0;
		return 0;
	}
	else
		top--;
    }
"}" {if(a[top]!='{')
	{
		valid=0;
		return 0;
	}
	else
		top--;
    }
"+"|"-"|"*"|"/"|"%" {operator++;strcpy(oprt[l],yytext);l++;}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* {operand++;strcpy(opnd[j],yytext);j++;}
%%

int main()
{
int k=0;
printf("Enter the expression:\n");
yylex();
if(valid==1 && top==-1 && (operand-operator)==1)
{
printf("Expression is valid\n");
printf("Operatores:");
for(k=0;k<l;k++)
printf("%s  ", oprt[k]);

printf("\nOperands:");
for(k=0;k<j;k++)
printf("%s  ",opnd[k]);
}

else
printf("Invalid expression\n");
}

int yywrap()
{
return 1;
}

