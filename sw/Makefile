CROSS_COMPILE=riscv32-unknown-elf-

CC     =$(CROSS_COMPILE)gcc
AS     =$(CROSS_COMPILE)as
LD     =$(CROSS_COMPILE)ld
SIZE   =$(CROSS_COMPILE)size
OBJCOPY=$(CROSS_COMPILE)objcopy
OBJDUMP=$(CROSS_COMPILE)objdump

all:

clean:
	rm -f *.elf *.bin *.hex

%.o: %.s	
#	riscv32-unknown-elf-as -march=rv32i -mabi=ilp32 $< -o $@
	$(AS) -march=rv32i -mabi=ilp32 $< -o $@

%.elf: %.o
	$(LD) $< -o $@
	$(SIZE) $<

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.hex: %.bin
	python3 makehex.py $< 2048 > $@

#%.hex: %.elf
#	$(OBJCOPY) -O ihex $< $@

