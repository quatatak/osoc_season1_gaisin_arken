CFLAGS=-Wall -g

all: ex1 ex3 ex7 ex8 ex9 ex10 ex11 ex12 ex13 ex14 ex15 ex16 ex17 gradesCalculator
ex1: ex1.c
	gcc $(CFLAGS) ex1.c -o ex1
ex3: ex3.c
	gcc $(CFLAGS) ex3.c -o ex3
ex7: ex7.c
	gcc $(CFLAGS) ex7.c -o ex7
ex8: ex8.c
	gcc $(CFLAGS) ex8.c -o ex8
ex9: ex9.c
	gcc $(CFLAGS) ex9.c -o ex9
ex10: ex10.c
	gcc $(CFLAGS) ex10.c -o ex10
ex11: ex11.c
	gcc $(CFLAGS) ex11.c -o ex11
ex12: ex12.c
	gcc $(CFLAGS) ex12.c -o ex12
ex13: ex13.c
	gcc $(CFLAGS) ex13.c -o ex13
ex14: ex14.c
	gcc $(CFLAGS) ex14.c -o ex14
ex15: ex15.c
	gcc $(CFLAGS) ex15.c -o ex15
ex16: ex16.c
	gcc $(CFLAGS) ex16.c -o ex16
ex17: ex17.c
	gcc $(CFLAGS) ex17.c -o ex17
gradesCalculator: gradesCalculator.c
	gcc $(CFLAGS) gradesCalculator.c -o gradesCalculator 
clean:
	rm -f ex1 ex3 ex7 ex8 ex9 ex10 ex11 ex12 ex13 ex14 ex15 ex16 ex17
