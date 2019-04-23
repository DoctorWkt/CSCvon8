test.vcd: a.out instr.rom ucode.rom
	vvp a.out

a.out: 74138.v 74161.v 74574.v 74593.v icarus_tb.v rom.v ttlcsvon8.v tbhelper.v
	iverilog -g2012 icarus_tb.v

clean:
	rm -f a.out *.vcd
