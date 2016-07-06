#! /bin/bash

lex example0.l
cc lex.yy.c -o example0 -ll
