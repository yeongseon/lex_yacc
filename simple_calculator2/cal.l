%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
	
void yyerror(char *);
%}

%%

[ \t]+				;

(([0-9]+(\.[0-9]*)?)|([0-9]*\.[0-9]+))		{ yylval.dval = atof(yytext);
											  return DOUBLE; }

[-+*/=]				{ return *yytext; }
"("					{ return *yytext; }
")"					{ return *yytext; }
[a-z]				{ yylval.ivar = *yytext;
					  return NAME; }
\n					{ return *yytext; }
.					{ char msg[25];
			  		  sprintf(msg, "%s <%s>", "invalid character", yytext);
			  		  yyerror(msg);	}
%%

int yywrap(void) {
	return 1;
}
