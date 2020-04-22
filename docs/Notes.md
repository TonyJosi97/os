# Notes 1

## Netwide Assembler

The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture. It can be used to write 16-bit, 32-bit (IA-32) and 64-bit (x86-64) programs. NASM is considered to be one of the most popular assemblers for Linux. 

NASM can output several binary formats, including COFF, OMF, a.out, Executable and Linkable Format (ELF), Mach-O and binary file (.bin, binary disk image, used to compile operating systems), though position-independent code is supported only for ELF object files. NASM also has its own binary format called RDOFF.

## QEMU

Software Type: `Hypervisor`

QEMU is a hosted virtual machine monitor: it emulates the machine's processor through dynamic binary translation and provides a set of different hardware and device models for the machine, enabling it to run a variety of guest operating systems. 

#### Binary translation

In computing, binary translation is a form of binary recompilation where sequences of instructions are translated from a source instruction set to the target instruction set. In some cases such as instruction set simulation, the target instruction set may be the same as the source instruction set, providing testing and debugging features such as instruction trace, conditional breakpoints and hot spot detection.

##### Instruction set simulation

An instruction set simulator (ISS) is a simulation model, usually coded in a high-level programming language, which mimics the behavior of a mainframe or microprocessor by "reading" instructions and maintaining internal variables which represent the processor's registers.

#### Hypervisor

A hypervisor (or virtual machine monitor, VMM) is computer software, firmware or hardware that creates and runs virtual machines. A computer on which a hypervisor runs one or more virtual machines is called a host machine, and each virtual machine is called a guest machine. 

## BIOS

BIOS (an acronym for Basic Input/Output System and also known as the System BIOS, ROM BIOS or PC BIOS) is firmware used to perform hardware initialization during the booting process (power-on startup), and to provide runtime services for operating systems and programs.The BIOS firmware comes pre-installed on a personal computer's system board, and it is the first software to run when powered on.

Unified Extensible Firmware Interface (UEFI) is a successor to the legacy PC BIOS, aiming to address its technical shortcomings.