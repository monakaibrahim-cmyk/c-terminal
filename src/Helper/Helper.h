#ifndef HELPER_H
#define HELPER_H

#include <time.h>

#define tprintf(format, ...) print_with_timestamp(format, ##__VA_ARGS__)

void print_with_timestamp(const char* format, ...);
void StringToLower(char* str);
int is_safe_hostname(const char* str);

#endif // HELPER_H