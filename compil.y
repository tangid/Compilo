%{
#include <stdio.h>
#include "tabStruct.h"
#include "tabInstruct.h"

int yylex(void);
int yyerror(char *);
int size;
int tempSize;
int cmp;
EntryList* el ;
InstructList* il ;
char tmp[16];
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

%type <str> tVAR tINT tDEC tEXP Unite

%% 

Document : tMAIN tAO Body tAF;

Body : 	| Ligne tEND Body | Cond Body;

Ligne :  |  Initialisation | Affectation | Print | Formule;

More : 	| tVIRG tVAR {add_entry(el,$2,1,0,1);printf("M : Entry %s added to symbol table\n",$2);}More ;
Unite : tDEC | tEXP;

Initialisation : 	tINT tVAR {add_entry(el,$2,1,0,1);
						printf("Entry %s added to symbol table\n",$2);size++;} More;
					
Affectation :  	tVAR  tEGAL  Formule {printf("Debut Affectation\n");
													 int vAdresse = find_symbol(el, $1);
													 sprintf(tmp,"%02x",size+tempSize);
													 add_Instruct(il,"06","01",tmp,"00");
													 sprintf(tmp,"%02x",vAdresse);
													 add_Instruct(il,"08",tmp,"01","00");
													  printf("Affectation\n");};

Formule : 	  Formule tADD Formule {tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"01","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tMUL Formule 		{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"02","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tSOUSTR Formule	{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"03","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tDIV Formule		{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"04","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tINF Formule		{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"0A","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tSUP Formule		{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"0C","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tEGAL_EGAL Formule	{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"09","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tSUP_EGAL Formule	{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"0D","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tINF_EGAL Formule	{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"0B","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Formule tNEGAL Formule		{tempSize--;
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize+1);
						add_Instruct(il,"07","02",tmp,"00");
						add_Instruct(il,"NEQU","01","01","02");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| tPO  Formule  tPF			
				| tVAR {int vAdresse = find_symbol(el, $1);tempSize++;
						sprintf(tmp,"%02x",vAdresse);
						add_Instruct(il,"07","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");}
				| Unite {tempSize++;
						printf("Unite\n");
						sprintf(tmp,"%02x",$1);
						add_Instruct(il,"06","01",tmp,"00");
						sprintf(tmp,"%02x",size+tempSize);
						add_Instruct(il,"08",tmp,"01","00");};

Print : tPRINT tPO Formule tPF {printf("Printing\n");}; 

If : tIF tPO Ligne tPF {tempSize--;
										sprintf(tmp,"%02x",size+tempSize);
										add_Instruct(il,"07","01",tmp,"00");
										add_If(il);}
										tAO Body tAF {add_End(il);};

Else :tELSE tAO Body tAF;

While : tWHILE tPO Ligne tPF{add_While(il);}  tAO Body tAF {end_While(il);};

Cond : If | If Else | While;


%%

int main(){
	size =0;
	tempSize = 0;
	el = make_list();
	il = make_ilist();
	yyparse();
	display_entry(*el);
	display_Instruct(*il);
	write_Instruct(*il);
}
