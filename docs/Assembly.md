# Assembly - NASM

## `$`

`$` is the address of the current position before emitting the bytes (if any) for the line it appears on.

`$ - msg` is like doing `here - msg`, i.e. the distance in bytes between the current position (at the end of the string) and the start of the string. 

## `$$`

`$$` refers to the address of the 1st line (where our section started). 

## Data

* DB - Define Byte. 8 bits
* DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
* DD - Define double word. Generally 4 bytes on a typical x86 32-bit system

## What does the 'h' suffix mean?

In x86 assembly, what does an h suffix on numbers represent?

For example:

`sub CX, 13h`

**"H" for "Hexadecimal"**

## Registers

Modern (i.e 386 and beyond) x86 processors have eight 32-bit general purpose registers, as depicted in Figure 1. The register names are mostly historical. For example, EAX used to be called the accumulator since it was used by a number of arithmetic operations, and ECX was known as the counter since it was used to hold a loop index. Whereas most of the registers have lost their special purposes in the modern instruction set, by convention, two are reserved for special purposes — the stack pointer (ESP) and the base pointer (EBP).

For the EAX, EBX, ECX, and EDX registers, subsections may be used. For example, the least significant 2 bytes of EAX can be treated as a 16-bit register called AX. The least significant byte of AX can be used as a single 8-bit register called AL, while the most significant byte of AX can be used as a single 8-bit register called AH. These names refer to the same physical register. When a two-byte quantity is placed into DX, the update affects the value of DH, DL, and EDX. These sub-registers are mainly hold-overs from older, 16-bit versions of the instruction set. However, they are sometimes convenient when dealing with data that are smaller than 32-bits (e.g. 1-byte ASCII characters).

When referring to registers in assembly language, the names are not case-sensitive. For example, the names EAX and eax refer to the same register.

AX is the 16 lower bits of EAX. AH is the 8 high bits of AX (i.e. the bits 8-15 of EAX) and AL is the least significant byte (bits 0-7) of EAX as well as AX.

Example (Hexadecimal digits):

EAX: 12 34 56 78
AX: 56 78
AH: 56
AL: 78


## INT (x86 instruction)

INT is an assembly language instruction for x86 processors that generates a software interrupt. It takes the interrupt number formatted as a byte value.[1]

When written in assembly language, the instruction is written like this:

`INT X`

where X is the software interrupt that should be generated (0-255).

Depending on the context, compiler, or assembler, a software interrupt number is often given as a hexadecimal value, sometimes with a prefix 0x or the suffix h. For example, INT 13H will generate the software interrupt 0x13 (19 in decimal), causing the function pointed to by the 20th vector in the interrupt table to be executed, which is typically a DOS API call.

## INT 10H

INT 10h, INT 10H or INT 16 is shorthand for BIOS interrupt call 10hex, the 17th interrupt vector in an x86-based computer system. The BIOS typically sets up a real mode interrupt handler at this vector that provides video services. Such services include setting the video mode, character and string output, and graphics primitives (reading and writing pixels in graphics mode).

To use this call, load AH with the number of the desired subfunction, load other required parameters in other registers, and make the call. INT 10h is fairly slow, so many programs bypass this BIOS routine and access the display hardware directly. Setting the video mode, which is done infrequently, can be accomplished by using the BIOS, while drawing graphics on the screen in a game needs to be done quickly, so direct access to video RAM is more appropriate than making a BIOS call for every pixel.

## Defining Strings

The convention is to declare strings as null-terminating, which means we always declare the last byte of the string as 0, as follows:

``` asm
my_string:
    db ’Booting OS’,0
```

When later iterating through a string, perhaps to print each of its characters in turn, we can easily determine when we have reached the end.

## Function Calls

At the CPU level a function is nothing more than a jump to the address of a useful routine then a jump back again to the instruction immediately following the first jump.

The caller code could store the correct return address (i.e. the address immediately after the call) in some well-known location, then the called code could jump back to that stored address. The CPU keeps track of the current instruction being executed in the special register ip (instruction pointer), which, sadly, we cannot access directly. However, the CPU provides a pair of instructions, call and ret, which do exactly what we want: call behaves like jmp but additionally, before actually jumping, pushes the return address on to the stack; ret then pops the return address off the stack and jumps to it.
