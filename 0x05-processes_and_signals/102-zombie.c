#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
/**
 * infinite_while - infinite while
 *
 * Return: always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Entry point
 *
 * Description - creates 5 zombie processes
 *
 * Return: nothing
 */
int main(void)
{
	int i;
	pid_t my_pid;

	for (i = 0; i < 5; i++)
	{
		my_pid = fork();
		if (!my_pid)
			exit(EXIT_FAILURE);
		printf("Zombie process created, PID: %u\n", my_pid);
	}
	infinite_while();
	return (EXIT_SUCCESS);
}
