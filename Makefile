all: u-boot.itb

bl31.elf:
	bash ./bl31.bash

scp.bin:
	bash ./crust.bash

u-boot.itb: bl31.elf scp.bin
	bash ./u-boot.bash
