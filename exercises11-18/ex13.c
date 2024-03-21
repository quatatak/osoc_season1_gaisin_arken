#include <stdio.h>

int main(int argc, char *argv[]){
	if (argc < 2){
		printf("ERROR: You should pass at least 1 argument\n");
		return 1;
	}
	for (int i = 1; i < argc; i++){
		printf("arg%d: %s\n", i, argv[i]);
	}	
	return 0;
}
