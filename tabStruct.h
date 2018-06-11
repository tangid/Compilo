#ifndef __tabStruct_H_
#define __tabStruct_H_
typedef struct Entry{
	char symbol[256];
	int type;
	int init;
	int depth;
	struct Entry* next;
} Entry;
typedef struct EntryList{
	Entry *first;
	int size;
} EntryList;

EntryList* make_list(void);
void add_entry(EntryList* entryl,char* symbol,int type,int init,int depth );
Entry* get_entry(EntryList* entryl, int nth);
int find_symbol(EntryList* entryl, char* symbol);
void display_entry(EntryList entryl);
/*void change_value(EntryList* entryl, int index, int val);*/
#endif
