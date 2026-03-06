#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <pthread.h>

#include "Handler.h"

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

// Helper
void StringToLower(char* str)
{
	for (; *str; ++str)
	{
		*str = (char)tolower((unsigned char)*str);
	}
}

void* wrapper(void* args)
{
	Thread* t = (Thread*)args;
	t->func(t->argc, t->argv);

	for (int i = 0; i < t->argc; i++)
	{
		free(t->argv[i]);
	}

	free(t->argv);
	free(t);

	return NULL;
}

void cmd_help(int argc, char** argv)
{
	pthread_mutex_lock(&mutex);

	if (argc > 1)
	{
		for (int i = 0; i < commands_count; i++)
		{
			if (strcmp(argv[1], commands[i].name) == 0)
			{
				printf("Usage for '%s': %s\n", commands[i].name, commands[i].desc);
				pthread_mutex_unlock(&mutex);
				return;
			}
		}

		printf("Unknown Command: '%s'\n", argv[1]);
	}
	else
	{
		printf("Available Commands:\n");

		for (int i = 0; i < commands_count; i++)
		{
			printf("  %-10s - %s\n", commands[i].name, commands[i].desc);
		}
	}

	fflush(stdout);

	pthread_mutex_unlock(&mutex);
}

void cmd_clear(int argc, char** argv)
{
	printf("\033[H\033[J");
	fflush(stdout);
}

void cmd_exit(int argc, char** argv)
{
	int seconds = 5; // default countdown value

	while (seconds > 0)
	{
		printf("\r\033[KShuttinig down in %d seconds", seconds);

		for (int j = 0; j < 3; j++)
		{
			printf(".");
			fflush(stdout);
			sleep(1);
		}

		seconds--;
	}

	printf("\033[H\033[J");

	exit(0);
}

Command commands[] =
{
	{
		"help",
		"Displays list of Commands Available",
		cmd_help,
		1
	},
	{
		"clear",
		"Clear the Terminal Screen",
		cmd_clear,
		0
	},
	{
		"exit",
		"Exits the Application",
		cmd_exit,
		0
	}
};

int commands_count = sizeof(commands) / sizeof(Command);

void handle(char* input)
{
	StringToLower(input);
	char** argv = malloc(sizeof(char*) * 10);
	int argc = 0;
	char* token = strtok(input, " \n");

	while (token && argc < 10)
	{
		argv[argc++] = strdup(token);
		token = strtok(NULL, " \n");
	}

	if (argc == 0)
	{
		free(argv);
		return;
	}

	for (int i = 0; i < commands_count; i++)
	{
		if (strcmp(argv[0], commands[i].name) == 0)
		{
			if (commands[i].is_threaded)
			{
				Thread* t = malloc(sizeof(Thread));
				t->func = commands[i].func;
				t->argc = argc;
				t->argv = argv;
				
				pthread_t thread;
				pthread_create(&thread, NULL, wrapper, t);
				pthread_detach(thread);
			}
			else
			{
				commands[i].func(argc, argv);

				for (int i = 0; i < argc; i++)
				{
					free(argv[i]);
				}

				free(argv);
			}

			return;
		}
	}

	printf("Unknown command: '%s'. Type 'help'.\n", argv[0]);
	
}
