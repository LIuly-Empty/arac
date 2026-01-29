#!bin/bash
clear
printf "\t==============================================
\t=          PARTITION DISK SCRIPT             =
\t==============================================\n"
printf "\tTien trinh nay se thuc hien phan vung o dia\n\n"

printf "1. Kiem tra firmware:"
if [ -d /sys/firmware/efi ]; then
    printf "\n-> He thong dang chay o che do UEFI.\n"
    firmware="UEFI"
else
    printf "\n-> He thong dang chay o che do BIOS.\n"
    firmware="BIOS"
fi

printf "2. Kiem tra o dia hien co:"
df -h