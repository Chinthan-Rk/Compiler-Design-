%{
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z]* {return id;}
[0-9]+ {return number;}
\n {return nl;}
. {return yytext[0];}
%%


