#!/bin/bash

pacstrap /mnt base base-devel linux-zen linux-firmware vim less dialog wpa_supplicant dhcpcd sudo reflector pacman-contrib usbutils pciutils

genfstab -U /mnt >> /mnt/etc/fstab

#Copy the files in arch-chroot
cp arch-chroot-packages.sh /mnt/arch-chroot-packages.sh
cp arch-hosts /mnt/arch-hosts

arch-chroot /mnt ./arch-chroot-packages.sh