#include <stdio.h>
#include <ctype.h>
#include <string.h>

int can_print_it(char ch);
void print_letters(int length, char* arg);
void print_words(int argc, char *argv[]){
	int i = 0;
	for(i = 0; i< argc; i++){
		int length = strlen(argv[i]);
		print_letters(length, argv[i]);
		printf("\n");
	}
}

void print_letters(int length,char* arg){
	for( int i = 0; i < length; i++){
		char ch = arg[i];
		if(can_print_it(ch)){
			printf(" %c: %d ", ch, ch); 
		}
	}
}
int can_print_it(char ch){
	return isalpha(ch)||isblank(ch);
}

int main(int argc, char *argv[]){
	print_words(argc, argv);
	return 0;
}
