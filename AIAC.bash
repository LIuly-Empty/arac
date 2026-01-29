#!/bin/bash
clear
echo "check EUFI mode or BIOS mode"
if [ -d /sys/firmware/efi ]; then
    echo "System is booted in UEFI mode"
else
    echo "System is booted in BIOS mode"
fi

printf "Cai dat arch linux cho nguoi moi:\n
1. Kiem tra ket noi mang
2. Phan vung o dia
3. Dinh dang o dia
4. Mount va truy cap arch-chroot"
