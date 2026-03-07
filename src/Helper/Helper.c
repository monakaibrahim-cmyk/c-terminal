#include <windows.h>
#include <stdio.h>
#include <time.h>
#include <ctype.h>

#include "Helper.h"

void print_with_timestamp(const char* format, ...)
{
	time_t rawtime;
    struct tm timeinfo;
    char buffer[20];

	time(&rawtime);
    localtime_s(&timeinfo, &rawtime);

    strftime(buffer, sizeof(buffer), "[%H:%M:%S] ", &timeinfo);
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

void list_dir(const char* base_path, const char* prefix, int is_last, int* file_count, int* dir_count)
{
    char search_path[MAX_PATH];
    snprintf(search_path, MAX_PATH, "%s\\*", base_path);

    WIN32_FIND_DATA entries[1024];
    int count = 0;
    HANDLE hFind = FindFirstFile(search_path, &entries[count]);

    if (hFind != INVALID_HANDLE_VALUE)
    {
        do
        {
            if (strcmp(entries[count].cFileName, ".") != 0 && strcmp(entries[count].cFileName, "..") != 0)
            {
                count++;
            }
        }
        while (FindNextFile(hFind, &entries[count]) && count < 1024);

        FindClose(hFind);
    }

    for (int i = 0; i < count; i++)
    {
        int last_child = (i == count - 1);
        char current_path[MAX_PATH];
        snprintf(current_path, MAX_PATH, "%s\\%s", base_path, entries[i].cFileName);

        printf("%s%s %s\n", prefix, last_child ? "└──" : "├──", entries[i].cFileName);

        if (entries[i].dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
        {
            (*dir_count)++;
            char new_prefix[MAX_PATH];
            snprintf(new_prefix, MAX_PATH, "%s%s   ", prefix, last_child ? " " : "│");
            
            list_dir(current_path, new_prefix, last_child, file_count, dir_count);
        }
        else
        {
            (*file_count)++;
        }
    }
}
