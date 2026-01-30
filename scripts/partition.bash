#!bin/bash
clear


# Mã    Màu chữ	        Mã  Màu nền
# 30	Xam	            40	Nền đen
# 31	Đỏ	            41	Nền đỏ
# 32	Xanh lá	        42	Nền xanh lá
# 33	Vàng	        43	Nền vàng
# 34	Tim     	    44	Nền xanh dương
# 35	Hong	        45	Nền tím
# 36	Cyan	        46	Nền cyan
# 37	Trắng	        47	Nền trắng

highlight() {
  local color=$1   # mã màu ANSI, ví dụ: 31 = đỏ, 32 = xanh lá
  shift            # bỏ tham số đầu tiên, giữ lại phần còn lại
  echo -e "\033[${color}m$@\033[0m"
}

highlight 32 "
\t==============================================
\t=          PARTITION DISK SCRIPT             =
\t=============================================="
highlight 32 "\tTien trinh nay se thuc hien phan vung o dia\n"

printf "\n\nKiem tra firmware:"
sleep 0.4
if [ -d /sys/firmware/efi ]; then

# Phan vung cho UEFi
    highlight 36 "-> He thong dang chay o che do UEFI.
Bat dau phan vung o dia cho UEFI o che do GPT\n"
    for i in {1..5}; do 
        for s in / - \\ \|; do 
            printf "\rĐang xử lý $s" 
            sleep 0.2 
        done 
    done
    printf "\n\nKiem tra dung luong o dia de phan vung: "
    lsblk | echo "sda" $(lsblk | grep sda | awk '{print $4}')
    if [ $(lsblk | grep sda | awk '{print $4}' | sed 's/G//') -lt 20 ]; then
        printf "\nCanh bao: O dia cua ban co dung luong nho hon 20GB. Vui long cap hon 20GB dung luong de tiep tuc cai dat.\n"
    else
        printf "Dung luong o dia du de tiep tuc cai dat.\n"
        printf "Tien hanh cai dat...\n"
        sleep 0.5
        DISK="/dev/sda"
        sgdisk --zap-all $DISK
        # Phan vung o sda1 -> EFI System Partition | type: EF00
        sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"EFI System Partition" $DISK
        mkfs.fat -F32 /dev/sda1
        highlight 35 "/dev/sda1 -> O dia cho EFI system: $(lsblk -f | grep sda1)\n"
        sleep 0.4

        # Phan vung o sda2 -> Linux Filesystem | type: 8300
        sgdisk -n 2:0:+20G -t 2:8300 -c 2:"Linux Filesystem" $DISK
        mkfs.ext4 /dev/sda2
        highlight 35 "/dev/sda2 -> O dia cho Linux filesystem: $(lsblk -f | grep sda2)\n"
        sleep 0.4

        # Phan vung o sda3 -> Linux Swap | type: 8200
        sgdisk -n 3:0:+4G -t 3:8200 -c 3:"Linux Swap" $DISK
        mkswap /dev/sda3
        swapon /dev/sda3
        highlight 35 "/dev/sda3 -> O dia cho Linux swap: $(lsblk -f | grep sda3)\n"
        sleep 0.4

        # Phan vung o sda4 -> Linux home | type: 8300
        sgdisk -n 4:0:0 -t 4:8300 -c 4:"Linux Home" $DISK
        mkfs.ext4 /dev/sda4
        highlight 35 "/dev/sda4 -> O dia cho Linux home: $(lsblk -f | grep sda4)\n"
        sleep 0.4

        printf "\nPhan vung o dia hoan tat, ban co muon kiem tra dung luong cua cac phan vung?\n"
        if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
            printf "Thoat khoi kiem tra dung luong.\n"
        else
            lsblk
        fi


    fi
    firmware="UEFI"
else
# Phan vung cho BIOS
    highlight 36 "
-> He thong dang chay o che do BIOS.
Bat dau phan vung o dia cho BIOS o che do MBR\n"
    for i in {1..5}; do 
        for s in / - \\ \|; do 
            printf "\rĐang xử lý $s" 
            sleep 0.2 
        done 
    done
    printf "\n\nKiem tra dung luong o dia de phan vung: "
    echo "sda ->" $(lsblk | grep sda | awk '{print $4}')
    firmware="BIOS"
fi