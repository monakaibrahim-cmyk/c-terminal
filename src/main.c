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

	printf("Terminal App v1.0. Type 'help' for commands.\n");

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
		printf("\033[1A\033[2K");
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
