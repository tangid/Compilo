%{
#include <stdio.h>
#include "tabStruct.h"
#include "tabInstruct.h"

int yylex(void);
int yyerror(char *);
int size;
int tempSize;
EntryList* el ;
InstructList* il;
%}

%union{
	int nb;
	char* str;
}

%token tEGAL tEGAL_EGAL tADD tSOUSTR tMUL tDIV tINF tSUP tNEGAL tSUP_EGAL tINF_EGAL
%token tPO tPF tAO tAF
%token tMAIN tCONST tINT
%token tVAR tDEC tEXP
%token tRET tEND tVIRG
%token tPRINT tIF tELSE tWHILE

%start Document

%left tINF tSUP tEGAL_EGAL tSUP_EGAL tINF_EGAL tNEGAL
%left tADD tSOUSTR
%left tMUL tDIV

%type <str> tVAR tINT
/*%type <nb> tDEC tEXP Unite*/ 
%%

Document : tMAIN tAO Body tAF;

Body : 	| Ligne tEND Body | Cond Body;

Ligne :  |  Initialisation | Affectation | Print | Formule;

More : 	| tVIRG tVAR More {add_entry(el,$2,1,0,1);printf("M : Entry %s added to symbol table\n",$2);};
Unite : tDEC ;

Initialisation : 	tINT tVAR More {add_entry(el,$2,1,0,1);
						printf("Entry %s added to symbol table\n",$2);size++;} ;
					
Affectation :  	tVAR  tEGAL  Formule {int vAdresse = find_symbol(el, $1);
													 add_Instruct(il,"AFC",1,size+tempSize,NULL);
													 add_Instruct(il,"STORE",vAdresse,1,NULL);};

Formule : 	  Formule tADD Formule {tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"ADD",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tMUL Formule 		{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"MUL",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tSOUSTR Formule	{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"SOU",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tDIV Formule		{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"DIV",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tINF Formule		{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"INF",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tSUP Formule		{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"SUP",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tEGAL_EGAL Formule	{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"EQU",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tSUP_EGAL Formule	{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"SUPE",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tINF_EGAL Formule	{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"INFE",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| Formule tNEGAL Formule		{tempSize--;
						add_Instruct(il,"LOAD",R1,size+tempSize,NULL);
						add_Instruct(il,"LOAD",R2,size+tempSize+1,NULL);
						add_Instruct(il,"NEQU",R1,R1,R2);
						add_Instruct(il,"STORE",size+tempSize,R1,NULL);}
				| tPO  Formule  tPF			
				| tVAR {int vAdresse = find_symbol(el, $1);tempSize++;
						add_Instruct(il,"LOAD",1,vAdresse,NULL);
						add_Instruct(il,"STORE",size+tempSize,1,NULL);}
				| Unite {tempSize++;
						add_Instruct(il,"AFC",1,$1,NULL);
						add_Instruct(il,"STORE",size+tempSize,1,NULL);};

Print : tPRINT tPO Formule tPF ; 

If : tIF tPO Ligne tPF tAO Body tAF;
		
Else :tELSE tAO Body tAF; 

While : tWHILE tPO Ligne tPF tAO Body tAF;

Cond : If | If Else | While;



%%

int main(){
	size =0;
	tempSize = 0;
	el = make_list();
	il = make_ilist();
	yyparse();
	display_entry(*el);
}
