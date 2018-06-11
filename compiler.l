%{
	#include "compil.tab.h"
	#include "tabStruct.h"
%}


%%

"int main()"	{ return tMAIN;}
"const" 	{ return tCONST;}
"int" 	{ return tINT;}
"=="		{ return tEGAL_EGAL;}
">="		{ return tSUP_EGAL;}
"<="		{ return tINF_EGAL;}
"="     	{ return tEGAL;}
"!="		{ return tNEGAL;}
"-"     	{ return tSOUSTR;}
"+"     	{ return tADD;}
"*"     	{ return tMUL;}
"/"     	{ return tDIV;}
"("     	{ return tPO;}
")"		{ return tPF;}
"}"     	{ return tAF;}
"{"		{ return tAO;}
">"		{ return tSUP;}
"<"		{ return tINF;}
"printf" { return tPRINT;}
"if"		{ return tIF;}
"else"	{ return tELSE;}
"while"	{ return tWHILE;}
[a-zA-Z]+[a-zA-Z0-9_]*		{ yylval.str = strdup(yytext);return tVAR;}
[-]?[0-9]+([.][0-9]+)?		{ yylval.nb = atoi(yytext);return tDEC;}
[-]?[0-9]+([.][0-9]+)?([e][-]?[1-9][0-9]*)			{yylval.nb = atoi(yytext);return tEXP;}
";"		{ return tEND;}
","		{ return tVIRG;}
[ \t\n]	;

%%






