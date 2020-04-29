
`At this low level, we have a lot of power and responsibility over our computer, so we need to learn how to control it.`

## BIOS

**`It is BIOS that loaded our 512-byte boot sector into memory and then, having finished its initialisations, told the CPU to jump to the start of our code, whereupon it began executing our first instruction, then the next, then the next, etc.`**

When the computer boots, the BIOS doesn't know how to load the OS, so it delegates that task to the boot sector. Thus, the boot sector must be placed in a known, standard location. That location is the first sector of the disk (cylinder 0, head 0, sector 0) and it takes 512 bytes.

To make sure that the "disk is bootable", the BIOS checks that bytes 511 and 512 of the alleged boot sector are bytes 0xAA55.

**BIOS cannot simply load a file that represents your operating system from a disk, since BIOS has no notion of a file- system. BIOS must read specific sectors of data (usually 512 bytes in size) from specific physical locations of the disk devices.** So, the easiest place for BIOS to find our OS is in the first sector of one of the disks (i.e. Cylinder 0, Head 0, Sector 0), known as the boot sector. 

Again, an unsophisticated means is adopted here by BIOS, whereby the last two bytes of an intended boot sector must be set to the magic number `0xaa55`. So, BIOS loops through each storage device (e.g. floppy drive, hard disk, CD drive, etc.), reads the boot sector into memory, and **instructs the CPU to begin executing the first boot sector it finds that ends with the magic number.**
`This is where we seize control of the computer.`

To compile: `nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin`

Run: qemu-system-x86_64 boot_sect_simple.bin

## 16-bit Real Mode

For backward compatibility, it is important that CPUs boot initially in 16-bit real mode, requiring modern operating systems explicitly to switch up into the more advanced 32-bit (or 64-bit) protected mode, but allowing older operating systems to carry on, blissfully unaware that they are running on a modern CPU

## Interupts 

BIOS adds some of its own ISRs to the interrupt vector that specialise in certain aspects of the computer, for example: interrupt 0x10 causes the screen-related ISR to be invoked; and interrupt 0x13, the disk-related I/O ISR.
However, it would be wasteful to allocate an interrupt per BIOS routine, so BIOS multiplexes the ISRs by what we could imagine as a big switch statement, based usually on the value set in one of the CPUs general 
purpose registers, ax, prior to raising the interrupt.


## Location of Boot Sector in Memory after BIOS loads it

As it turns out, BIOS likes always to load the boot sector to the address `0x7c00`, where it is sure will not be occupied by important routines.

BIOS has already being doing initialisation work on the computer long before it loaded our code, and will actually continue to service hardware interrupts for the clock, disk drives, and so on. So these BIOS routines (e.g. ISRs, services for screen printing, etc.) themselves must be stored somewhere in memory and must be preserved (i.e. not overwritten) whilst they are still of use.

![Memory Layout](https://github.com/TonyJosi97/os/blob/master/docs/resources/Typical%20lower%20memory%20layout%20after%20boot.png)

## Adding base memory with offset for labels - `[org 0x7c00]`

BIOS does indeed load our boot sector to the address
0x7c00, and we have also seen how addressing and assembly code labels are related.
It is inconvenient to always have to account for this label--memory offset in your code, so many assemblers will correct label references during assemblege if you include the following instruction at the top of your code, telling it exactly where you expect the
code to loaded in memory:

`[org 0x7c00]`

It asks the assembler to make the literal map to exact location in memory.

The ORG instruction is used to provide a "hint" to the assembler and the linker for the resulting object file. It allows you to specify the base address of the section of the file.

## Defining Strings

The convention is to declare strings as null-terminating, which means we always declare the last byte of the string as 0, as follows:

``` asm
my_string:
db ’Booting OS’,0
```

When later iterating through a string, perhaps to print each of its characters in turn, we can easily determine when we have reached the end.```
