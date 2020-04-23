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
