#include <stdio.h>

int main(int argc, char *argv[]){
	int numbers[4] = {0};
	char name[4] = {'a'};

	printf("The numbers are %d %d %d %d\n", numbers[0], numbers[1], numbers[2], numbers[3]);
	printf("The name is %c %c %c %c\n", name[0], name[1], name[2], name[3]);

	numbers[0] = 0;
	numbers[1] = 1;
	numbers[2] = 2;
	numbers[3] = 3;

	name[0] = 'N';
	name[1] = 'e';
	name[2] = 'd';
	name[3] = 'o';
	printf("The numbers are %d %d %d %d\n", numbers[0], numbers[1], numbers[2], numbers[3]);
	printf("The name is %c %c %c %c\n", name[0], name[1], name[2], name[3]);
	
	char *another = "Ned";
	printf("Another name is: %s\n", another);
	printf("%c %c %c %c\n", another[0], another[1], another[2], another[3]);
	printf("%s\n", name);

	printf("\nPrikol :%d", name[0]);
	return 0;
}
