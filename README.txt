
README

PLEASE CHECK YOUR VERSION OF BISON. Mac OS comes with a very old version (2.3 approx.)
The program includes a %require “version” after the declarations. The file has written 2.3 
after which the %error-verbose is defined. This serves to provide more information about the
syntax error. If a more recent version of bison, such as 3.1 is available, you may change the version and block the %error-verbose declaration and unblock %define parse.error verbose to achieve the same result.

This is a simple program that gets tokes from lex and uses bison to parse through a file.

To compile:
		lex fly.l	
		bison -d bison.y
		gcc bison.tab.c lex.yy.c -o test -ll

To run include the file before execution:
		./test testfile.c
