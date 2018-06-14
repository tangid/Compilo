
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
void add_Instruct(InstructList* instructl,char* op,char* a,char* b,char* c);
//Instruct* get_instruct(InstructList* instructl, int nth);
//int find_symbol(InstructList* instructl, char* symbol);
void display_Instruct(InstructList instructl);
void write_Instruct(InstructList instructl);
/*void change_value(InstructList* instructl, int index, int val);*/

