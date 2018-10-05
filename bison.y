/****************************************************************/
/* Program created by Gabriel Garces Chavez, Maria Fernanda  	*/
/*		Delgado						*/
/* for Programming Languages course 				*/
/* To run first compile lex with:				*/
/*        bison -d filename.y					*/
/* !! NOTE: this program requires a lex file !!			*/
/* Then compile C program with the lex generated file as:	*/
/*      gcc lex.yy.c filename.tab.y -o name -ll  (mac)		*/
/* 	gcc flex.yy.c filename.tab.y -o name -lfl (linux)	*/
/* The program requires another file as input			*/
/* so when running the program one must include 		*/
/* it like so:							*/
/*     ./name readthisFile.txt					*/
/****************************************************************/

%{
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void yyerror (const char *string); /* Declaration of error function not defined in bison */
extern int yylex();			/*function that reads from lex 			*/
extern int yyparse();			/* parses the tokens received from lex 		*/
extern FILE *yyin;			/* pointer to file used by lex			*/
extern int yylineno;			/* line number for errors defined in lex, used here	*/
int flag =0;				/* simple flag that checks if an error was found	*/

%}
%require "2.3"
%error-verbose				/* BISON 2.3- Provides more detail about errors found */
//%define parse.error verbose		/* BISON 3.1- Provides more detail about errors found */

%union{					/* Structure that stores the values found by lex	*/
	int ival;
	float fval;
	char *sval;
}
/* Declaration of terminal tokens along with their type	*/
%token <ival> INT_NUM
%token <fval> FLOAT_NUM
%token <sval> IF
%token <sval> INTEGER
%token <sval> FLOAT
%token <sval> THEN
%token <sval> WHILE
%token <sval> ELSE
%token <sval> READ
%token <sval> WRITE
%token <sval> DO
%token <sval> ID
%token <sval> LBRACE
%token <sval> RBRACE
%token <sval> LPAREN
%token <sval> RPAREN
%token <sval> SEMI
%token <sval> ASSIGN
%token <sval> TIMES
%token <sval> DIV
%token <sval> PLUS
%token <sval> MINUS
%token <sval> LT
%token <sval> EQ


%%
/* Grammar declarations */
program: var_dec stmt_seq;

var_dec: var_dec single_dec 
	| //%empty		/* Defined by bison to make explicit it can be empty/ epsilon */
	;
	
single_dec: type ID SEMI ;

type:	 INTEGER 
	| FLOAT 
	;

stmt_seq: stmt_seq stmt 
	| //%empty
	;
stmt: IF exp THEN stmt 
	| IF exp THEN stmt ELSE stmt
	| WHILE exp DO stmt 
	| variable ASSIGN exp SEMI
	| READ LPAREN variable RPAREN SEMI
	| WRITE LPAREN exp RPAREN SEMI
	| block
	;

block: LBRACE stmt_seq RBRACE 
	;

exp:	 simple_exp LT simple_exp 
	| simple_exp EQ simple_exp 
	| simple_exp
	;

simple_exp: simple_exp MINUS term 
	| simple_exp PLUS term 
	| term
	;

term: 	term TIMES factor 
	| term DIV factor 
	| factor
	;

factor: LPAREN exp RPAREN 
	| INT_NUM 
	| FLOAT_NUM 
	| variable
	;

variable: ID 
	;


%%
//int yylex();

/* Function name: yyerror		*/
/* Parameters: String defining error	*/
/* This function receives any error in 	*/
/* the file found by the parser		*/
/* It prints the error and approx. line	*/
/* number where error might be found	*/
void yyerror (const char *string){
  printf ("Error near line %d: %s\n",yylineno,string);
  flag =1;			/* Indicate an error was found */
}

int main ( int argc, const char *argv[] ){
	if(argc < 2) /* Check that a file was inputed */
	{
		printf("No file input! Please enter a file with program execution\nTerminating execution\n");
		return(1);
	}
  	else
	{
		yyin = fopen(argv[1], "r"); /*	open file and send it to lex	*/
		if(!yyin)
		{
		  	printf("Error opening file! Check name or path\nTerminating execution\n");
			exit(1);
		}
		else
		{
			
	 		yyparse();	/* Function of bison that parses the tokens of lex 	*/
			/*If an error was not found print alt gud, if an error is found the program terminates itself so a definition of an error termination is unnecesary */
			if(flag==0)	
				printf("finished without errors!\n");
		}
	}
 	return 0;
}
