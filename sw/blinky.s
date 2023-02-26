/**********************************************************************?
?* LED Blinker                                                        */
/* Assuming that GPIO_BASE is mapped to a GPIO core, which in turn is */
/* connected to LEDs, this will light the LEDs one at a time.         */
/* Useful as smoke test to see that serv is running correctly         */
/**********************************************************************/
	
/*
 * a0 = LED GPIO base address
 * t0 = LED control Value
 * t1 = counter maximum value
 * t2 = counter current value
 */

.globl  _start

.equ    GPIO_BASE, 0x00000100
.equ    DELAY,     0x0000FFFF
.equ    RED,       0x1
.equ    GRN,       0x2
.equ    BLU,       0x4


_start:
	/* Load GPIO base address to a0 */
	lui a0, %hi(GPIO_BASE)
	addi a0, a0, %lo(GPIO_BASE)

	/* Set temporary register 1 value to control blink speed */
	li t1, DELAY

bl1:
	/* Write to LEDs */
	sb t0, 0(a0)

	/* invert LED */
	xori t0, t0, GRN

	/* Reset counter */
	and t2, zero, zero

	/* Delay loop */
time1:
	addi t2, t2, 1
	bne t1, t2, time1
	j bl1
