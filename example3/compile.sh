#! /bin/bash
lex example3.l
yacc -d example3.y
cc lex.yy.c y.tab.c -o example3 
