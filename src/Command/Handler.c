#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "Handler.h"
#include "Helper/Helper.h"

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
atomic_int is_busy = 0;

int get_command_index(const char* name)
{
	for (int i = 0; i < commands_count; i++)
	{
		if (strcmp(commands[i].name, name) == 0)
		{
			return i; // Found index number
		}
	}

	return -1; // Not Found
}

void* wrapper(void* args)
{
	Thread* t = (Thread*)args;
	is_busy = 1;

	t->func(t->argc, t->argv);

	for (int i = 0; i < t->argc; i++)
	{
		free(t->argv[i]);
	}

	free(t->argv);
	free(t);

	is_busy = 0;

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
				printf("Description: %s\n", commands[i].desc);
                printf("Usage:       %s\n", commands[i].usage);
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

void cmd_curl(int argc, char** argv)
{
	int idx = get_command_index(argv[0]);

	if (argc < 2)
	{
		pthread_mutex_lock(&mutex);
		printf("%s\n", commands[idx].usage);
		pthread_mutex_unlock(&mutex);
		return;
	}
	
	char command[2048] = "curl ";

	for (int i = 1; i < argc; i++)
	{
		if (strpbrk(argv[i], ";|&><$()"))
		{
			pthread_mutex_lock(&mutex);
			tprintf("Error: Illegal character in arguments.");
			pthread_mutex_unlock(&mutex);
			return;
		}

		strncat(command, argv[i], sizeof(command) - strlen(command) - 1);
		strncat(command, " ", sizeof(command) - strlen(command) - 1);
	}

	strncat(command, "2>&1", sizeof(command) - strlen(command) - 1);

	FILE* pipe = popen(command, "r");

	if (!pipe)
	{
		pthread_mutex_lock(&mutex);
		tprintf("Error: Could not execute curl.");
		pthread_mutex_unlock(&mutex);
        return;
	}

	char buffer[512];

	while (fgets(buffer, sizeof(buffer), pipe) != NULL)
	{
		if (buffer[0] == '*' || buffer[0] == '>' || buffer[0] == '<')
		{
			continue;
		}

		pthread_mutex_lock(&mutex);
        tprintf("%s", buffer);
		fflush(stdout);
        pthread_mutex_unlock(&mutex);
	}

	pclose(pipe);
}

void cmd_ping(int argc, char** argv)
{
	int idx = get_command_index(argv[0]);

	if (argc < 2)
	{
		pthread_mutex_lock(&mutex);
		printf("%s\n", commands[idx].usage);
		pthread_mutex_unlock(&mutex);
		return;
	}

	if (!is_safe_hostname(argv[1]))
	{
		pthread_mutex_lock(&mutex);
        printf("Error: Invalid characters in hostname.\n");
        pthread_mutex_unlock(&mutex);
        return;
	}

	char command[256];
	snprintf(command, sizeof(command), "ping -c 4 %s", argv[1]);

	FILE* fp = popen(command, "r");

	if (fp == NULL)
	{
		pthread_mutex_lock(&mutex);
        printf("Failed to run ping.\n");
        pthread_mutex_unlock(&mutex);
        return;
	}

	char line[256];
	
	while (fgets(line, sizeof(line), fp) != NULL)
	{
		pthread_mutex_lock(&mutex);
		tprintf("[%s] %s", argv[1], line);
		fflush(stdout);
		pthread_mutex_unlock(&mutex);
	}

	pclose(fp);
}

void cmd_tree(int argc, char** argv)
{
	if (system("command -v tree > /dev/null 2>&1") == 0)
	{
		char command[512] = "tree ";

		if (argc > 1)
		{
			strncat(command, argv[1], 500);
		}
		else
		{
			strncat(command, ".", 2);
		}

		FILE* pipe = popen(command, "r");

		if (pipe)
		{
			char buffer[256];

			while (fgets(buffer, sizeof(buffer), pipe))
			{
				printf("%s", buffer);
			}

			pclose(pipe);
			return;
		}
	}

	const char* path = (argc > 1) ? argv[1] : ".";
	int files = 0;
    int dirs = 0;

	printf("%s\n", path);
	list_dir(path, "", 1, &files, &dirs);
	printf("\n%d directories, %d files\n", dirs, files);
	fflush(stdout);
}

void cmd_exit(int argc, char** argv)
{
	int seconds = 5; // default countdown value

	while (seconds > 0)
	{
		printf("\r\033[KShutting down in %d seconds", seconds);

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
		"help | help <command>",
		cmd_help,
		1
	},
	{
		"clear",
		"Clear the Terminal Screen",
		"clear",
		cmd_clear,
		0
	},
	{
		"curl",
		"Sends HTTP requests",
		"curl [options] <url> (e.g., curl -I https://google.com)",
		cmd_curl,
		1
	},
	{
		"ping",
		"Pings a host",
		"ping <hostname> | e.g ping 127.0.0.1 or ping www.google.com",
		cmd_ping,
		1
	},
	{
		"tree",
		"List directory contents in a tree structure",
		"tree [directory]",
		cmd_tree,
		1
	},
	{
		"exit",
		"Exits the Application",
		"exit",
		cmd_exit,
		0
	}
};

const int commands_count = sizeof(commands) / sizeof(Command);

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

	int idx = get_command_index(argv[0]);

	if (idx != -1)
	{
		if (commands[idx].is_threaded)
		{
			Thread* t = malloc(sizeof(Thread));
            t->func = commands[idx].func;
            t->argc = argc;
            t->argv = argv;

			pthread_t thread;
            pthread_create(&thread, NULL, wrapper, t);
            pthread_detach(thread);
		}
		else
		{
			commands[idx].func(argc, argv);

			for (int i = 0; i < argc; i++)
			{
				free(argv[i]);
			}

			free(argv);
		}

		return;
	}

	printf("Unknown command: '%s'. Type 'help'.\n", argv[0]);
}
