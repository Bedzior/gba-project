#include <gba_console.h>
#include <gba_video.h>
#include <gba_interrupt.h>
#include <gba_systemcalls.h>
#include <gba_input.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
	irqInit();
	irqEnable(IRQ_VBLANK);

	consoleDemoInit();

	iprintf("\x1b[2J");

	// ansi escape sequence to set print co-ordinates
	// /x1b[line;columnH
	iprintf("\x1b[10;10HHello World!");

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
		VBlankIntrWait();
	}

    return 0;
}
