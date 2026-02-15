#!/bin/bash
clear

# File nay chay trong arch-chroot
# Set timezone
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
# Set locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "vi_VN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
# Set hostname
echo "archlinux" > /etc/hostname

# Install and configure GRUB
pacman -Sy grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${TX_GREEN}Cai dat he dieu hanh va bootloader hoan tat!${TX_NC}"
echo "Nhan nut bat ki de khoi dong lai..."
read -n 1 -s

exit