{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww14980\viewh8540\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs28 \cf0 README\
\
PLEASE CHECK YOUR VERSION OF BISON. Mac OS comes with a very old version (2.3 approx.)\
The program includes a %require \'93version\'94 after the declarations. The file has written 2.3 \
after which the 
\i \ul %error-verbose
\i0 \ulnone  is defined. This serves to provide more information about the\
syntax error. If a more recent version of bison, such as 3.1 is available, you may change the version and block the 
\i \ul %error-verbose 
\i0 \ulnone declaration and unblock 
\i \ul %define parse.error
\i0 \ulnone  verbose to achieve the same result.\
\
This is a simple program that gets tokes from lex and uses bison to parse through a file.\
\
To compile:\
		lex fly.l	\
		bison -d bison.y\
		gcc bison.tab.c lex.yy.c -o test -ll\
\
To run include the file before execution:\
		./test testfile.c}