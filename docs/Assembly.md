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