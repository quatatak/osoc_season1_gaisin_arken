#include <stdio.h>

int main(int argc, char* argv[]){
	
	int i = 0;
	if(argc == 1) {
		printf("You only have 1 argument. You suck.\n");
	} else if ( argc > 1 && argc < 4) {
		printf("Here's your arguments:\n");
		for(; i< argc; i++){
			printf("%s ", argv[i]);
		}
		printf("\n");
	} else {
		printf("You have too many arguments. \n");
	}

	return 0;
}
