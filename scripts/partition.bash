#!bin/bash
clear
printf "
\t==============================================
\t=          PARTITION DISK SCRIPT             =
\t==============================================\n"
    for i in {1..5}; do 
        for s in / - \\ \|; do 
            printf "\rTien trinh nay se thuc hien phan vung o dia $s" 
            sleep 0.2 
        done 
    done

printf "\n\nKiem tra firmware:"
if [ -d /sys/firmware/efi ]; then
# Phan vung cho UEFi
    printf "
-> He thong dang chay o che do UEFI.
Bat dau phan vung o dia cho UEFI o che do GPT\n"
    for i in {1..5}; do 
        for s in / - \\ \|; do 
            printf "\rĐang xử lý $s" 
            sleep 0.2 
        done 
    done
    printf "\n\nKiem tra dung luong o dia de phan vung: "
    lsblk | echo "sda" $(lsblk | grep sda | awk '{print $4}')
    firmware="UEFI"
else
# Phan vung cho BIOS
    printf "
-> He thong dang chay o che do BIOS.
Bat dau phan vung o dia cho BIOS o che do MBR\n"
    for i in {1..5}; do 
        for s in / - \\ \|; do 
            printf "\rĐang xử lý $s" 
            sleep 0.2 
        done 
    done
    printf "\n\nKiem tra dung luong o dia de phan vung: "
    lsblk | echo "sda" $(lsblk | grep sda | awk '{print $4}')
    firmware="BIOS"
fi