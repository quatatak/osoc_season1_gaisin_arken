#include <stdio.h>

int main(int argc, char *argv[]){
	char fullname[] = {'A', 'r', 'k', 'e', 'n', 'G','a','i','s','i','n', '\0'};
	int areas[] = {10,12,13,14,15};
	char name[] = "Arken";
	printf("The size of int array %ld\n", sizeof(areas));
	printf("The size of int %ld\n", sizeof(int));
	printf("The number of ints in an array: %ld\n", sizeof(areas)/sizeof(int));
       	
	printf("The size of char array: %ld\n", sizeof(name));
	printf("The size of char: %ld\n", sizeof(char));
	printf("The number of chars in an array: %ld\n", sizeof(name)/sizeof(char));

	printf("The sizeof of \"fullname\" array: %ld\n", sizeof(fullname));
	printf("The number of chars in that array: %ld\n", sizeof(fullname)/sizeof(char));
	
	areas[1] = name[3];
	areas[2] = 100;
	name[4] = 'g';
	printf("%s\n",fullname);
	printf("%s %d+%d\n", name, areas[1], areas[2]);

	return 0;
}
