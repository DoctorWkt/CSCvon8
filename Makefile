all: alu.rom ucode.rom

alu.rom: gen_alu
	./gen_alu

ucode.rom: microcode gen_ucode
	./gen_ucode

clean:
	rm -rf *.rom
