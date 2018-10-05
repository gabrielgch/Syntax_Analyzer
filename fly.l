/************************************************/
/* Program created by Gabriel Garces Chavez 	*/
/* for Programming Languages course 		*/
/* To run first compile lex with:		*/
/*        flex lexicalAnalisis.l		*/
/* Then compile C program with			*/
/*      gcc lex.yy.c -o name -ll  (mac)		*/
/* 	gcc flex.yy.c -o name -lfl (linux)	*/
/* The program requires another file as input	*/
/* so when running the program one must include */
/* it like so:					*/
/*     ./name readthisFile.txt			*/
/************************************************/


/* This is the declaration section */
%{
	#include "bison.tab.h" /* added declarations of tokens defined in the file created by bison */
%}
%option yylineno
 /* This is the rule definition */
/*Since tokens are sent to bison/yacc this file simply returns the values found by lex, making copies of strings */
/* in the future, considerations to free them should be noted */
%%

"int"					{yylval.sval = strdup(yytext); return INTEGER;}
"float"					{yylval.sval = strdup(yytext); return FLOAT;}
"if"					{yylval.sval = strdup(yytext); return IF;}
"then"					{yylval.sval = strdup(yytext); return THEN;}
"while"					{yylval.sval = strdup(yytext); return WHILE;}
"else"					{yylval.sval = strdup(yytext); return ELSE;}
"read"					{yylval.sval = strdup(yytext); return READ;}
"write"					{yylval.sval = strdup(yytext); return WRITE;}
"do"					{yylval.sval = strdup(yytext); return DO;}
"{"					{yylval.sval = strdup(yytext); return LBRACE;}
"}"					{yylval.sval = strdup(yytext); return RBRACE;}
"("					{yylval.sval = strdup(yytext); return LPAREN;}
")"					{yylval.sval = strdup(yytext); return RPAREN;}
";"					{yylval.sval = strdup(yytext); return SEMI;}
":="					{yylval.sval = strdup(yytext); return ASSIGN;}
"*"					{yylval.sval = strdup(yytext); return TIMES;}
"/"					{yylval.sval = strdup(yytext); return DIV;}
"+"					{yylval.sval = strdup(yytext); return PLUS;}
"-"					{yylval.sval = strdup(yytext); return MINUS;}
"<" 					{yylval.sval = strdup(yytext); return LT;}
"="					{yylval.sval = strdup(yytext); return EQ;}
[0-9][0-9]*|0(c|C)[0-7]+|0(x|X)[0-9A-Fa-f]+|[0-9]+([eE][-+]?[0-9]+)?     {yylval.ival = atoi(yytext); return INT_NUM;}
[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?  {yylval.fval = atof(yytext); return FLOAT_NUM;}
[A-Za-z_][A-Za-z0-9]* 			{yylval.sval = strdup(yytext); return ID;}
(\/\/.*|"/*"([^*]|\*+[^*/])*\*+"/")	;
[ \t\n\f\v\r ]  ;
.		;
%%

