#include<stdio.h>

int main(int argc, char *argv[]) {
	int numbers[4] = {0};
	char names[4] = {'a'};
	printf("%d %d %d %d\n",numbers[0], numbers[1], numbers[2], numbers[3]);
	printf("%c %c %c %c\n", names[0], names[1], names[2], names[3]);

	printf("%s\n", names);

	numbers[0] = 1;
	numbers[1] = 2;
	numbers[2] =3;
	numbers[3] = 4;

	names[0] = 'J';
	names[1] = 'o';
	names[2] = 'n';
	names[3] = '\0';

	printf("%d %d %d %d\n", numbers[0], numbers[1], numbers[2], numbers[3]);
	printf("%c %c %c %c\n", names[0], names[1], names[2], names[3]);

	char *another = "Jon";
	printf("%s\n", another);
	printf("%s\n", names);
	return 0;
}
