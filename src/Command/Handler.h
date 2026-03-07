#ifndef COMMAND_HANDLER_H
#define COMMAND_HANDLER_H

#include <time.h>
#include <stdatomic.h>

#define tprintf(format, ...) print_with_timestamp(format, ##__VA_ARGS__)

typedef void (*command_func)(int argc, char** argv);

typedef struct
{
	const char* name; // name of the command
	const char* desc; // description
	const char* usage; // usage of the command
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
void print_with_timestamp(const char* format, ...);

extern Command commands[];
extern const int commands_count;
extern atomic_int is_busy;

#endif // COMMAND_HANDLER_H
