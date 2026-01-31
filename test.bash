#!/bin/bash

DISK="/dev/sda"

# Lấy dung lượng ổ đĩa (tính bằng MiB)
SIZE=$(lsblk -b -dn -o SIZE $DISK)
SIZE_MIB=$((SIZE / 1024 / 1024))

echo ">>> Ổ đĩa $DISK có dung lượng ~${SIZE_MIB} MiB"

# Xóa bảng phân vùng cũ và tạo GPT mới
parted -s $DISK mklabel gpt

# EFI: 512 MiB
parted -s $DISK mkpart ESP fat32 1MiB 513MiB
parted -s $DISK set 1 boot on

# Root: chiếm 20% dung lượng
ROOT_END=$((SIZE_MIB / 5 + 513))
parted -s $DISK mkpart primary ext4 513MiB ${ROOT_END}MiB

# Swap: 2 GiB (2048 MiB)
SWAP_END=$((ROOT_END + 2048))
parted -s $DISK mkpart primary linux-swap ${ROOT_END}MiB ${SWAP_END}MiB

# Home: phần còn lại
parted -s $DISK mkpart primary ext4 ${SWAP_END}MiB 100%

# In bảng phân vùng
parted -s $DISK print

echo ">>> Định dạng phân vùng..."
mkfs.fat -F32 ${DISK}1
mkfs.ext4 ${DISK}2
mkswap ${DISK}3
mkfs.ext4 ${DISK}4

echo ">>> Mount phân vùng..."
mount ${DISK}2 /mnt
mkdir /mnt/boot
mount ${DISK}1 /mnt/boot
mkdir /mnt/home
mount ${DISK}4 /mnt/home
swapon ${DISK}3

echo ">>> Hoàn tất! /mnt đã sẵn sàng."
