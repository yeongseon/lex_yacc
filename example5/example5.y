%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *str)
{
	fprintf(stderr, "error: %s\n", str);
}

void yywrap()
{
	return 1;
}

main()
{
	yyparse();
}
%}

%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE

%%
commands:	/* empty */
		| commands command
		;

command:
		heat_switch
		|
		target_set
		;

heat_switch:
		TOKHEAT STATE
		{
			if($2)
				printf("\tHeat turned on or off\n");
			else
				printf("\tHeat turned off\n");
		}
		;

target_set:
		TOKTARGET TOKTEMPERATURE NUMBER
		{
			printf("\tTemerature set %d\n", $3);
		}	
		;
