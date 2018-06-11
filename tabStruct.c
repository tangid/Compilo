#include <stdio.h>
#include "tabStruct.h"
#include <string.h>
#include <stdlib.h>

EntryList* make_list(){
	EntryList* el = (EntryList*)malloc(sizeof(EntryList));
	el->first = NULL;
	el->size = 0;
	return (EntryList*)el;
}
void add_entry(EntryList* entryl,char* symbol,int type,int init,int depth ){
	Entry* ne = malloc(sizeof(Entry));
	Entry* tmp = entryl->first;	
	// Creation element
	strcpy(ne->symbol,symbol);
	ne->type=type;
	ne->init=init;
	ne->depth=depth;
	// Update list size
	entryl->size++;
	// Parcours fin de liste
	if(tmp==NULL)
		entryl->first = ne;
	else {
		while(tmp->next!=NULL)
			tmp=tmp->next;
		tmp->next=ne;
	}
}

Entry* get_entry(EntryList* entryl, int nth){	
	Entry* tmp;	
	if (nth < entryl->size && nth >= 0){
		tmp = entryl->first;
		while(nth>0){
			tmp = tmp->next;
			nth--;
		}
		return tmp;
	}
	return NULL;
}

int find_symbol(EntryList* entryl, char* symbol){
	int pos = 0;
	Entry* tmp= entryl->first;
	while(tmp!=NULL && !strcmp(tmp->symbol,symbol)){
		tmp = tmp->next;
		pos++;
	}
	if (tmp==NULL)
		return -42;
	return pos;
}

void display_entry(EntryList entryl){
	Entry* tmp = entryl.first;
	while(tmp!=NULL){
		printf("[S:%s | T:%d | I:%d | D:%d]\n",tmp->symbol,tmp->type,tmp->init,tmp->depth);
		tmp=tmp->next;
	}
}
/*
void change_value(EntryList* entryl, int index, int val)
{
	Entry* tmp = get_entry(entryl, index);
	tmp->init = val; 

}
*/
