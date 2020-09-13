#!/bin/bash

echo Fixing time, language, and privileges....
echo Note: you may need to manipulate some files yourself
sleep 5s
#set time
ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
hwclock --systohc

#networks and lang setup
echo en_PH.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen
echo LANG=en_PH.UTF-8 > /etc/locale.conf
export LANG=en_PH.UTF-8
echo iko-ASUSX560UD > /etc/hostname
cat arch-hosts > /etc/hosts
cat /etc/hosts

#initramfs
mkinitcpio -P

#new user and password + privileges
useradd -m -G sys,wheel,users,adm,log -s /bin/bash iko
EDITOR=vim visudo

#repo work
vim /etc/pacman.conf
reflector --country 'Singapore' --age 17 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

echo Now installing KDE, Xorg, and other essential packages
sleep 5s
#package install hell
pacman -S --noconfirm xorg xorg-apps xorg-server xorg-drivers xterm mesa linux-headers xdg-user-dirs fuse2 fuse3 ntfs-3g exfat-utils pulseaudio gvfs dkms haveged git unrar unzip htop lsb-release polkit man-db man-pages firefox cups system-config-printer foomatic-db-engine foomatic-db-ppds foomatic-db-nonfree-ppds gutenprint ghostscript networkmanager network-manager-applet lightdm lightdm-gtk-greeter ttf-ubuntu-font-family ttf-dejavu ttf-bitstream-vera ttf-liberation noto-fonts intel-ucode texinfo keepass cinnamon bluez bluez-utils wget curl

systemctl enable lightdm.service
systemctl enable NetworkManager.service
systemctl enable org.cups.cupsd.service


#assuming efi install:
pacman -S --noconfirm grub efibootmgr os-prober
grub-install --target=x86_64-efi --bootloader-id=grub --efi-directory=/boot/efi 
grub-mkconfig -o /boot/grub/grub.cfg

echo Finished installing packages, going back to the live ISO...
