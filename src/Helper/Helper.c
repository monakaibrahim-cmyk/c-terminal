#include <ctype.h>
#include <dirent.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

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

void list_dir(const char* base_path, const char* prefix, int is_last, int* file_count, int* dir_count)
{
    DIR* dir = opendir(base_path);

    if (!dir)
    {
        return;
    }

    struct dirent* entry;
    struct dirent* entries[1024];
    int count = 0;

    while ((entry = readdir(dir)) != NULL)
    {
        if (entry->d_name[0] != '.')
        {
            entries[count++] = entry;
        }
    }

    for (int i = 0; i < count; i++)
    {
        int last_child = (i == count - 1);
        char* name = entries[i]->d_name;
        char path[1024];
        struct stat st;

        printf("%s%s %s\n", prefix, last_child ? "└──" : "├──", name);

        snprintf(path, sizeof(path), "%s/%s", base_path, name);

        if (stat(path, &st) == 0)
        {
            if (S_ISDIR(st.st_mode))
            {
                (*dir_count)++;
                char new_prefix[512];

                snprintf(new_prefix, sizeof(new_prefix), "%s%s   ", prefix, last_child ? " " : "│");
                list_dir(path, new_prefix, last_child, file_count, dir_count);
            }
            else
            {
                (*file_count)++;
            }
        }
    }

    closedir(dir);
}
