%token	INTEGER VARIABLE
%left	'+' '-'
%left	'*' '/'


%{
	void	yyerror(char *);
	int		yylex(void);	
	int		sym[26];
%}

%%

program:
	program statement '\n'
	|
	;

 /* 변수를 만났을 경우 */

statement:
	expr				{ printf("계산결과 %d\n", $1); }
	| VARIABLE '=' expr	{ sym[$1] = $3; }
	;

expr:
	INTEGER
	| VARIABLE			{ $$ = sym[$1]; }
	| expr '+' expr		{ $$ = $1 + $3; }
	| expr '-' expr 	{ $$ = $1 - $3; }
	| expr '*' expr		{ $$ = $1 * $3; }
	| expr '/' expr		{ $$ = $1 / $3; }
	| '(' expr ')'		{ $$ = $2; }
	;

%%
void yyerror(char *s)
{
	printf("%s\n", s);
	return 0;
}

int main(void)
{
	yyparse();
	return 0;
}
