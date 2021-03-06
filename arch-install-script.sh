#!/bin/bash

passwd

pacstrap /mnt base base-devel linux linux-firmware vim less dialog wpa_supplicant dhcpcd sudo reflector pacman-contrib usbutils pciutils

genfstab -U /mnt >> /mnt/etc/fstab

#Copy the files in arch-chroot
cp arch-chroot-packages.sh /mnt/arch-chroot-packages.sh
cp arch-hosts /mnt/arch-hosts

arch-chroot /mnt ./arch-chroot-packages.sh
echo Setting up your passwords...
sleep 5s
echo Set your root password
arch-chroot /mnt passwd
echo Set your user password
arch-chroot /mnt passwd iko
