## BIOS

When the computer boots, the BIOS doesn't know how to load the OS, so it delegates that task to the boot sector. Thus, the boot sector must be placed in a known, standard location. That location is the first sector of the disk (cylinder 0, head 0, sector 0) and it takes 512 bytes.

To make sure that the "disk is bootable", the BIOS checks that bytes 511 and 512 of the alleged boot sector are bytes 0xAA55.

**BIOS cannot simply load a file that represents your operating system from a disk, since BIOS has no notion of a file- system. BIOS must read specific sectors of data (usually 512 bytes in size) from specific physical locations of the disk devices.** So, the easiest place for BIOS to find our OS is in the first sector of one of the disks (i.e. Cylinder 0, Head 0, Sector 0), known as the boot sector. 

To compile: `nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin`

Run: qemu-system-x86_64 boot_sect_simple.bin
