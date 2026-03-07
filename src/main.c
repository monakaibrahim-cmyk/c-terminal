#include <stdio.h>
#include <string.h>
#include <time.h>
#include "Command/Handler.h"

// Helper
void msleep(long milliseconds)
{
	struct timespec ts;
    ts.tv_sec = milliseconds / 1000;
    ts.tv_nsec = (milliseconds % 1000) * 1000000L;

	while (nanosleep(&ts, &ts) == -1)
	{
        continue;
    }
}

int main(int argc, char* argv[])
{
	char buffer[256];

	printf("Terminal App v1.0. Type 'help' for commands.\n");

	while(1)
	{
		while (atomic_load(&is_busy))
		{
			struct timespec ts = {0, 100000000L};
			nanosleep(&ts, &ts);
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

	return 0;
}
