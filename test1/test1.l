%{
	/*
	 * My favorite..
	 */
%}

%%
[\t ]+			;
rain|rose		{printf("%s!! That is my favorite.\n", yytext);}
love|story		{printf("%s!! I like a love story.\n", yytext);}
"potato chip"|potato|chip 		{printf("%s...! now and then. I have potato chip.\n", yytext);}
[A-Za-z]+		{printf("%s..., what is that?\n", yytext);}
.|\n			{ECHO;}
%%

main()
{
	yylex();
}
