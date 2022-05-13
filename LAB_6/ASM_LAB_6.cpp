#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <time.h>
#include <math.h>

int main() {
	double mas[10];
	double new_mas[10];

	puts("Entry massive of 10 numbers");
	for (int i = 0; i < 10; i++) {
		while (scanf_s("%lf", &mas[i]) == 0) {
			puts("Error input. Try again...");
			rewind(stdin);
		}
	}

	system("cls");
	puts("Input massive:");
	for (int i = 0; i < 10; i++)
		printf("%2d. %f\n", i+1, mas[i]);
	 
	_asm {
		mov ecx, 10
		xor esi, esi
		xor edi, edi

		finit

		loop_start :
		fld mas[esi]

		sum_elem_loop:
		cmp esi, edi
		je write_to_new_mas
		fadd mas[edi]
		add edi,8
		jmp sum_elem_loop

		write_to_new_mas:
		fstp new_mas[esi]
		add esi, 8
		xor edi, edi
		loop loop_start

		fwait
	}

	puts("\nOutput massive");
	for (int i = 0; i < 10; i++)
		printf("%2d. %f\n", i+1, new_mas[i]);
}