#include <windows.h>
#include <process.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Handler.h"
#include "Helper/Helper.h"

atomic_int is_busy = 0;
CRITICAL_SECTION cs;

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

unsigned __stdcall wrapper(void* args)
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

	return 0;
}

void cmd_clear(int argc, char** argv)
{
	system("cls");
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
			Sleep(1000);
		}

		seconds--;
	}

	system("cls");
	exit(EXIT_SUCCESS);
}

Command commands[] =
{
	{
		"clear",
		"Clear the Terminal Screen",
		"clear",
		cmd_clear,
		0
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

			_beginthreadex(NULL, 0, wrapper, t, 0, NULL);
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

	printf("Unknown command: '%s'.\n", argv[0]);
}
