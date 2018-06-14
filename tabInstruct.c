#include <stdio.h>
#include "tabInstruct.h"
#include <string.h>
#include <stdlib.h>
#define MAXSIZE 50

 
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
struct stack

{

    int stk[MAXSIZE]; // change to dynamic implementation if I got time;
    int top;

};


typedef struct stack STACK;

STACK s;
void push (int val)
{
    if (s.top == (MAXSIZE - 1))
    {
        printf ("Stack is Full\n");
        return;
    }
    else
    {
        s.top = s.top + 1;
        s.stk[s.top] = val;
    }
    return;
}

/*  Function to delete an element from the stack */

int pop ()
{
    int num;
    if (s.top == - 1)
    {
        printf ("Stack is Empty\n");
        return (s.top);
    }
    else
    {
        num = s.stk[s.top];
        s.top = s.top - 1;
    }
    return(num);
}

InstructList* make_ilist(){

	printf("Making INstruction list\n");
	InstructList* el = (InstructList*)malloc(sizeof(InstructList));
	el->first = NULL;
	el->size = 0;
	return el;
}

void add_Instruct(InstructList* instructl,char* op,char* a,char* b,char* c ){	
	printf("Add_Instr\n");
	Instruct* ne = malloc(sizeof(Instruct));
	Instruct* tmp = instructl->first;
	// Creation element
	printf("Add_Instr\n");
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
	int curr = 0;
	Instruct* tmp = Instructl.first;
	while(tmp!=NULL){
		printf("%04x :: [OP:%s | A:%s | B:%s | C:%s]\n",curr,tmp->op,tmp->a,tmp->b,tmp->c);
		tmp=tmp->next;
		curr++;
	}
}
void write_Instruct(InstructList Instructl){
	FILE *f = fopen("ROM.hex", "w");
	if (f == NULL)
	{
		 printf("Error opening file!\n");
		 exit(1);
	}
	Instruct* tmp = Instructl.first;
	while(tmp!=NULL){
		fprintf(f,"%s%s%s%s\n",tmp->op,tmp->a,tmp->b,tmp->c);
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


void add_If(InstructList* instructl){
	push(instructl->size); // Save the current instruction addr
	add_Instruct(instructl,"0F","00","00","01");		
}
void add_While(InstructList* instructl){
	push(instructl->size+1); // Save the next instruction addr
}
void end_While(InstructList* instructl){
char tmp[16];
	char a[3]="00";
	char b[3]="00";
	Instruct* tm;
	sprintf(tmp,"%04x",pop());
	strncpy ( a, tmp,2);
	strncpy ( b, tmp+2,2);
	add_Instruct(instructl,"0F",a,b,"01");		
}
void add_End(InstructList* instructl){
	char tmp[16];
	char a[3]="00";
	char b[3]="00";
	Instruct* tm;
	sprintf(tmp,"%04x",instructl->size);
	strncpy ( a, tmp,2);
	strncpy ( b, tmp+2,2);
	printf("test :%s, %s, %s,%d\n",tmp,a,b,instructl->size);
	tm = get_Instruct(instructl,pop());
	strcpy(tm->a,a);
	strcpy(tm->b,b);
}

