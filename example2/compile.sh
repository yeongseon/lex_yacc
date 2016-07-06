#! /bin/bash
lex example2.l
cc lex.yy.c -o example2 -ll
