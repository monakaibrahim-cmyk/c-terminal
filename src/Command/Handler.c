#include <windows.h>
#include <process.h>
#include <errno.h>
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

void cmd_help(int argc, char** argv)
{
	if (argc > 1)
	{
		printf("\n");

		for (int i = 0; i < commands_count; i++)
		{
			if (strcmp(argv[1], commands[i].name) == 0)
			{
				printf("Description: %s\n", commands[i].desc);
                printf("Usage:       %s\n", commands[i].usage);

				if (strcmp(commands[i].name, "ping") == 0)
				{
					printf(
						"\t\t-t : Pings the specified host continuously until stopped. \n"
						"\t\t-l <size> : Specifies the size, in bytes, of the echo request packet to send, from 32 to 65,527 bytes. The default size is 32 bytes.\n"
						"\t\t-a : Resolves the hostname of an IP address target, if possible.\n"
						"\t\t-f : Prevents ICMP Echo Requests from being fragmented by routers between the source and destination (IPv4 only).\n"
						"\t\t-i <TTL> : Sets the Time to Live (TTL) value for the packets, with a maximum of 255.\n"
						"\t\t-w <timeout> : Adjusts the timeout in milliseconds for each reply. The default is 4,000 milliseconds (4 seconds).\n"
						"\t\t-4 : Forces the use of IPv4.\n"
						"\t\t-6 : Forces the use of IPv6.\n"
						"\t\t/? : Displays detailed help and syntax information about the command options in the command prompt.\n"
					);
				}

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
			
			printf("\t" FG_GREEN "%-10s" RESET " - %s\n", commands[i].name, commands[i].desc);
		}
	}

	fflush(stdout);
}

void cmd_clear(int argc, char** argv)
{
	system("cls");
}

void cmd_tree(int argc, char** argv)
{
	const char* path = (argc > 1) ? argv[1] : ".";
	int files = 0;
    int dirs = 0;

	printf(FG_GREEN "%s" RESET "\n", path);
	list_dir(path, "", 1, &files, &dirs);
	printf("\n" FG_YELLOW "%d" RESET " directories, " FG_YELLOW "%d" RESET " files\n", dirs, files);
	fflush(stdout);
}

void cmd_ping(int argc, char** argv)
{
	int idx = get_command_index(argv[0]);

	if (argc < 2)
	{
        printf("%s\n", commands[idx].usage);
        return;
	}

	char command[256];
	strncpy(command, "ping ", sizeof(command) - 1);
	command[sizeof(command) - 1] = '\0';

	for (int i = 1; i < argc; i++)
    {
        strncat(command, argv[i], sizeof(command) - strlen(command) - 1);
        strncat(command, " ", sizeof(command) - strlen(command) - 1);
    }

	FILE* pipe = _popen(command, "r");

	if (!pipe)
    {
        printf(FG_RED "Error: Failed to execute ping.\n" RESET);
        return;
    }

	char buffer[128];

    while (fgets(buffer, sizeof(buffer), pipe) != NULL)
    {
        printf("%s", buffer);
        fflush(stdout);
    }

    pclose(pipe);
}

void cmd_touch(int argc, char** argv)
{
	int idx = get_command_index(argv[0]);

	if (argc < 2)
	{
        printf("%s\n", commands[idx].usage);
        return;
	}

	char* path = argv[1];
    char dir[256];
    strncpy(dir, path, sizeof(dir) - 1);
    dir[sizeof(dir) - 1] = '\0';

	for (int i = 0; dir[i]; i++)
	{
		if (dir[i] == '/')
		{
			dir[i] = '\\';
		}
	}

	char *sep = strrchr(dir, '\\');

	if (sep != NULL)
	{
		*sep = '\0';

		if (_mkdir(dir) != 0 && errno != EEXIST)
		{
			tprintf(FG_RED"Error: Could not create directory '%s' (Errno: %d)\n" RESET, dir, errno);
			return;
		}
	}

	FILE* file = fopen(path, "a");

	if (!file)
    {
        perror("Error creating file");
        return;
    }

	fclose(file);
	tprintf("Touched: " FG_GREEN "%s" RESET "\n", argv[1]);
}

void cmd_exit(int argc, char** argv)
{
	system("cls");
	exit(EXIT_SUCCESS);
}

Command commands[] =
{
	{
		"help",
		"Displays list of Commands Available",
		"help | help <command>",
		cmd_help,
		0
	},
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
		"ping",
		"Pings a hostname.",
		"ping <args> [hostname]",
		cmd_ping,
		1
	},
	{
		"touch",
		"Creates a file.",
		"touch [file|path/to/file]",
		cmd_touch,
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
