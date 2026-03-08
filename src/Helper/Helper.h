#ifndef HELPER_H
#define HELPER_H

#include <time.h>

/* Standard Foreground Colors */
#define FG_BLACK   "\x1B[30m"
#define FG_RED     "\x1B[31m"
#define FG_GREEN   "\x1B[32m"
#define FG_YELLOW  "\x1B[33m"
#define FG_BLUE    "\x1B[34m"
#define FG_MAGENTA "\x1B[35m"
#define FG_CYAN    "\x1B[36m"
#define FG_WHITE   "\x1B[37m"

/* Bright Foreground Colors */
#define FG_B_BLACK   "\x1B[90m"
#define FG_B_RED     "\x1B[91m"
#define FG_B_GREEN   "\x1B[92m"
#define FG_B_YELLOW  "\x1B[93m"
#define FG_B_BLUE    "\x1B[94m"
#define FG_B_MAGENTA "\x1B[95m"
#define FG_B_CYAN    "\x1B[96m"
#define FG_B_WHITE   "\x1B[97m"

/* Background Colors */
#define BG_BLACK   "\x1B[40m"
#define BG_RED     "\x1B[41m"
#define BG_GREEN   "\x1B[42m"
#define BG_YELLOW  "\x1B[43m"
#define BG_BLUE    "\x1B[44m"
#define BG_MAGENTA "\x1B[45m"
#define BG_CYAN    "\x1B[46m"
#define BG_WHITE   "\x1B[47m"

/* Text Styles */
#define TXT_BOLD      "\x1B[1m"
#define TXT_DIM       "\x1B[2m"
#define TXT_ITALIC    "\x1B[3m"
#define TXT_UNDERLINE "\x1B[4m"
#define TXT_BLINK     "\x1B[5m"
#define TXT_REVERSE   "\x1B[7m"
#define TXT_STRIKE    "\x1B[9m"

/* The All-Important Reset */
#define RESET "\x1B[0m"

#define tprintf(format, ...) print_with_timestamp(format, ##__VA_ARGS__)

void print_with_timestamp(const char* format, ...);
void StringToLower(char* str);
int is_safe_hostname(const char* str);
void list_dir(const char* base_path, const char* prefix, int is_last, int* file_count, int* dir_count);

#endif // HELPER_H