%{
#include "y.tab.h"
%}

%%
"if" {return IF;}
"<"|">"|"<="|">="|"=="|"!=" {return RELOP;}
[0-9]+ {return NUMBER;}
[a-zA-Z]+ {return ID;}
[sS][0-9]* {return S;}
[\n] {;}
. {return yytext[0];}
%%

int yywrap()
{
return 1;
}

