#include <verilatedos.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <sys/types.h>
#include <signal.h>
#include "verilated.h"
#include "Vcscvon8.h"
#include "testb.h"

int	main(int argc, char **argv) {
	Verilated::commandArgs(argc, argv);
	TESTB<Vcscvon8>	*tb
		= new TESTB<Vcscvon8>;
	unsigned oldPC=100, PC;

	tb->opentrace("cscvon8.vcd");

	for (unsigned clocks=0; clocks < 20000000; clocks++) {
		tb->tick();
		// If we jump back to the same PC, exit
		if (tb->m_core->IRload == 0) {
			PC= tb->m_core->PCval;
			if (oldPC == PC) exit(0);
			oldPC = PC;
		}
	}
	printf("\n\nSimulation complete\n");
}
