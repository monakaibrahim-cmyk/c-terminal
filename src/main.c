#include <windows.h>
#include <stdio.h>
#include <string.h>

#include "Command/Handler.h"
#include "Helper/Helper.h"

// Helper
void msleep(long milliseconds)
{
	Sleep((DWORD)milliseconds);
}

int main(int argc, char* argv[])
{
	SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);
	
	char buffer[256];

	printf("Terminal App v1.0.\n");

	while(1)
	{
		while (atomic_load(&is_busy))
		{
			msleep(100);
		}

		printf("[CMD] >> ");
		fflush(stdout);

		if (!fgets(buffer, sizeof(buffer), stdin))
		{
			break;
		}

		// Remove line
		HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		GetConsoleScreenBufferInfo(hConsole, &csbi);
		
		COORD coord = { 0, csbi.dwCursorPosition.Y };
		DWORD written;
		FillConsoleOutputCharacter(hConsole, ' ', csbi.dwSize.X, coord, &written);
		SetConsoleCursorPosition(hConsole, coord);

		fflush(stdout);

		buffer[strcspn(buffer, "\n")] = 0;

		if (strlen(buffer) > 0)
		{
			handle(buffer);
			msleep(50);
		}
	}

	return EXIT_SUCCESS;
}
