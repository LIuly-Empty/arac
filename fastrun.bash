#!/bin/bash

source src/color.bash

clear

DISK="/dev/sda"
sgdisk --zap-all $DISK

if [ -d /sys/firmware/efi ]; then
    # Phan vung o sda1 -> EFI System Partition | type: EF00
    sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"EFI System Partition" $DISK
    mkfs.fat -F32 /dev/sda1
else
    sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"BIOS boot" $DISK
    mkfs.ext4 /dev/sda1
fi

# Phan vung o sda3 -> Linux Swap | type: 8200
sgdisk -n 3:0:+4G -t 3:8200 -c 3:"Linux Swap" $DISK
mkswap /dev/sda3
swapon /dev/sda3

# Phan vung o sda4 -> Linux home | type: 8300
sgdisk -n 4:0:+5G -t 4:8300 -c 4:"Linux Home" $DISK
mkfs.ext4 /dev/sda4

# Phan vung o sda2 -> Linux Filesystem | type: 8300
sgdisk -n 2:0:+20G -t 2:8300 -c 2:"Linux Filesystem" $DISK
mkfs.ext4 /dev/sda2

echo -e "${TX_GREEN}Phan vung o dia hoan tat!${TX_NC}"
echo "Nhan nut bat ki de tiep tuc..."
read -n 1 -s

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware vim sudo networkmanager
systemctl enable NetworkManager --root=/mnt
genfstab -U /mnt >> /mnt/etc/fstab

cp arac/test.bash /mnt/test.bash

arch-chroot /mnt /bin/bash << EOF
bash /test.bash
EOF

umount -R /mnt
reboot