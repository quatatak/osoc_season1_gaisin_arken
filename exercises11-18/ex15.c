#include <stdio.h>

int main(int argc, char *argv[]){
	int ages[] = {13,24,62,43,7};
	char *names[] = {"Ryzhii", "Bankir", "Black", "Bamboo", "Stone"};
	int count = sizeof(ages)/sizeof(int);

	for(int i = 0; i< count; i++){
		printf("The age of %s is %d\n", names[i], ages[i]);
	}
	
	printf("---\n");
	int *cur_age = ages;
	char **cur_name = names;

	for(int i = 0; i<count; i++){
		printf("The age of %s is %d\n", cur_name[i], cur_age[i]);
	}
	printf("---\n");

	for(int i = 0; i<count; i++){
		printf("The ages of %s is %d\n", *(cur_name+i), *(cur_age+i));
	}
	return 0;
}
