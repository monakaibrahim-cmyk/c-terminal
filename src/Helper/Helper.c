#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "Helper.h"

void print_with_timestamp(const char* format, ...)
{
	time_t rawtime;
    struct tm *timeinfo;
    char buffer[20];

	time(&rawtime);
    timeinfo = localtime(&rawtime);

	strftime(buffer, sizeof(buffer), "[%H:%M:%S] ", timeinfo);

	printf("%s", buffer);

	va_list args;
    va_start(args, format);
	vprintf(format, args);
	va_end(args);
}

void StringToLower(char* str)
{
	for (; *str; ++str)
	{
		*str = (char)tolower((unsigned char)*str);
	}
}

int is_safe_hostname(const char* str)
{
	if (str == NULL || strlen(str) == 0)
	{
		return 0;
	}

	for (int i = 0; str[i] != '\0'; i++)
	{
		if (!isalnum((unsigned char)str[i]) && str[i] != '.' && str[i] != '-')
		{
			printf("DEBUG: Rejected char at index %d: '%c' (ASCII %d)\n", i, str[i], str[i]);
			return 0;
		}
	}

	return 1;
}
