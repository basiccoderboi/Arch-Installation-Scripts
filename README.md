# Arch-Installation-Scripts
This script aims to help you\* setup Arch Linux easily, with the formatting of disks to only worry about. Be informed that on some parts, you will be asked to modify some files, so this still requires an understanding of Arch Linux to use.

\*Mostly me, might share next time



How to use this:

OPTIONAL: Setup keyboard layout if need be

0. Set up your system time
1. Format partitions using cfdisk
2. mkfs.ext4 your root partitions
3. mkswap+swapon your swaps
4. mkfs.fat -F32 your efi partition (if you have efi partition), otherwise mount on exisiting partition
5. Mount your root+efi partition
6. Run arch-install-script and feel proud that you installed Arch Linux

ADVICE:
efi partition - around 550M

swap - size of RAM + 0.5M

root - rest of device
