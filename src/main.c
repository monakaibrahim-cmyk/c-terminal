#include <stdio.h>
#include <string.h>
#include <time.h>
#include "Command/Handler.h"

int main(int argc, char* argv[])
{
	char buffer[256];

	printf("Terminal App v1.0. Type 'help' for commands.\n");

	while(1)
	{
		printf("[CMD] >> ");
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

			struct timespec ts = {0};
			ts.tv_sec = 0;
			ts.tv_nsec = 50000000L;

			while (nanosleep(&ts, &ts) == -1)
			{
				continue;
			}
		}
	}

	return 0;
}
