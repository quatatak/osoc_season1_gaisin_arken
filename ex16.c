#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

struct Person {
	char *name;
	int age;
	int height;
	int weight;
};

struct Person *Person_create(char* name, int age, int weight, int height)
{	
	struct Person *who = malloc(sizeof(struct Person));
	assert(who != NULL);

	who->name = strdup(name);
	who->age = age;
	who->height = height;
	who->weight = weight;

	return who;
}

void Person_destroy(struct Person *who)
{
	assert(who != NULL);
	free(who->name);
	free(who);
}

void Person_print(struct Person *who)
{
	printf("Name: %s\n", who->name);
	printf("\tAge: %d\n", who->age);
	printf("\tHeight: %d\n", who->height);
	printf("\tWeight: %d\n", who->weight);
}
int main(int argc, char *argv[]){
	struct Person *arken = Person_create("Arken", 19, 190, 70);
	struct Person *chris = Person_create("Chris", 53, 189, 80);
       	

	printf("Arken is at memory location %p\n", arken);
	Person_print(arken);

	printf("Chris is at memory location %p\n", chris);
	Person_print(chris);	
	
	arken->age = 20;
	chris->weight = 78;
	Person_print(arken);
	Person_print(chris);

	Person_destroy(arken);
	Person_destroy(chris);
	
	return 0;
}
