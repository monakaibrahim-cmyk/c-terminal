#ifndef COMMAND_HANDLER_H
#define COMMAND_HANDLER_H

typedef void (*command_func)(int argc, char** argv);

typedef struct
{
	const char* name; // name of the command
	const char* desc; // description
	command_func func;
	int is_threaded; // bool | 1 = background, 0 = foreground
} Command;

typedef struct
{
	command_func func;
	int argc;
	char** argv;
} Thread;


void handle(char* input);

extern Command commands[];
extern int commands_count;

#endif // COMMAND_HANDLER_H
