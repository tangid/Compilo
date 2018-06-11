#ifndef __tabInstruct_H_
#define __tabInstruct_H_
typedef struct Instruct{
	char op[256];
	char a[256];
	char b[256];	
	char c[256];	
	struct Instruct* next;
} Instruct;
typedef struct InstructList{
	Instruct *first;
	int size;
} InstructList;

InstructList* make_ilist(void);
void add_instruct(InstructList* instructl,char* symbol,int type,int init,int depth );
Instruct* get_instruct(InstructList* instructl, int nth);
int find_symbol(InstructList* instructl, char* symbol);
void display_instruct(InstructList instructl);
/*void change_value(InstructList* instructl, int index, int val);*/
#endif
