%{
#include "y.tab.h"
%}

%%
"int" {return INT;}
"char" {return CHAR;}
[ ] {return SP;}
[;] {return SC;}
[,] {return CO;}
\n {return NL;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
. {return yytext[0];}
%%

