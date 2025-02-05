#include <stdio.h>

int add_nums(int num1, int num2);

int main(void)
{
	printf("%d\n", add_nums(5, 4));

	return 0;

}

int add_nums(int num1, int num2)
{
	return num1 + num2;

}
