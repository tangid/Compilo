#include <stdio.h>
#include "tabInstruct.h"
#include <string.h>
#include <stdlib.h>

InstructList* make_ilist(){
	InstructList* el = (InstructList*)malloc(sizeof(InstructList));
	el->first = NULL;
	el->size = 0;
	return el;
}
void add_Instruct(InstructList* instructl,char* op,char* a,char* b,char* c ){
	Instruct* ne = malloc(sizeof(Instruct));
	Instruct* tmp = instructl->first;
	// Creation element
	strcpy(ne->op,op);
	strcpy(ne->a,a);
	strcpy(ne->b,b);
	strcpy(ne->c,c);
	// Update list size
	instructl->size++;
	// Parcours fin de liste
	if(tmp==NULL)
		instructl->first = ne;
	else {
		while(tmp->next!=NULL)
			tmp=tmp->next;
		tmp->next=ne;
	}
}
/*
Instruct* get_Instruct(InstructList* Instructl, int nth){	
	Instruct* tmp;	
	if (nth < Instructl->size && nth >= 0){
		tmp = Instructl->first;
		while(nth>0){
			tmp = tmp->next;
			nth--;
		}
		return tmp;
	}
	return NULL;
}

int find_symbol(InstructList* Instructl, char* symbol){
	int pos = 0;
	Instruct* tmp= Instructl->first;
	while(tmp!=NULL && !strcmp(tmp->symbol,symbol)){
		tmp = tmp->next;
		pos++;
	}
	if (tmp==NULL)
		return -42;
	return pos;
}
*/
void display_Instruct(InstructList Instructl){
	Instruct* tmp = Instructl.first;
	while(tmp!=NULL){
		printf("[Cmd:%s | A:%s | B:%s | DST:%s]\n",tmp->op,tmp->a,tmp->b,tmp->dst);
		tmp=tmp->next;
	}
}
char* instruct_to_asm(Instruct* i){
	char* buff = malloc(256*sizeof(char));
	if(i->c!=NULL)
			sprintf(buff,"%s		%d,%d,%d",i->op,i->a,i->b,i->c);
	else if(i->b!=NULL)
			sprintf(buff,"%s		%d,%d",i->op,i->a,i->b);
	else if(i->a!=NULL)
			sprintf(buff,"%s		%d",i->op,i->a);
	return buff;
}

