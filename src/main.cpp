#include <gba_console.h>
#include <gba_video.h>
#include <gba_interrupt.h>
#include <gba_systemcalls.h>
#include <gba_input.h>
#include <stdio.h>
#include <stdlib.h>
#include <fade.h>

#include "system/System.hpp"

static auto i = 0;

void VblankInterrupt()
{
	scanKeys();
}

int main() {
	System system;
	irqInit();

	irqSet(IRQ_VBLANK, VblankInterrupt);
	irqEnable(IRQ_VBLANK);

	consoleDemoInit();

	iprintf("\x1b[2J");

	// ansi escape sequence to set print co-ordinates
	// /x1b[line;columnH
	iprintf("\x1b[10;10HHello, World!");

	// ansi escape sequence to move cursor up
	// /x1b[linesA
	iprintf("\x1b[10ALine 0");

	// ansi escape sequence to move cursor left
	// /x1b[columnsD
	iprintf("\x1b[28DColumn 0");

	// ansi escape sequence to move cursor down
	// /x1b[linesB
	iprintf("\x1b[19BLine 19");

	// ansi escape sequence to move cursor right
	// /x1b[columnsC
	iprintf("\x1b[5CColumn 20");

	while (1) {
		auto ticks = system.get_ticks_since_start();
		auto secs = system.get_seconds_since_start();
		fprintf(stdout, "Seconds passed since inception: %i", secs);
		VBlankIntrWait();
	}

    exit(0);
}
