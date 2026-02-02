#!/bin/bash
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

printf "\t==============================================
\t=       INSTALL ARCH LINUX AUTOMATION        =
\t==============================================\n"

printf "Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap"
printf "\nCac tien trinh se duoc dien ra:
1. Phan vung o dia
2. Cai dat he thong file len o dia
3. Cai dat he dieu hanh Arch Linux
4. Cau hinh he thong co ban
5. Cai dat bootloader
6. Cai dat them phan mem can thiet
7. Hoan tat va khoi dong lai\n"
printf "\nNhan y de tiep tuc hoac n de thoat!? -> "
read choice
if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    printf "Thoat chuong trinh.\n"
    clear
    exit 0
fi
printf "\nBat dau cai dat...\n"
clear

# Run partition script
cd scripts
bash partition.bash
sleep 3
printf "\t==============================================
\t=       INSTALL ARCH LINUX AUTOMATION        =
\t==============================================\n"

printf "Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap"
printf "\nCac tien trinh se duoc dien ra:\n"
echo -e "1. Phan vung o dia -> \033[35mHoan tat!\033[0m\n"
printf "2. Cai dat he thong file len o dia\n"
printf "3. Cai dat he dieu hanh Arch Linux\n"
printf "4. Cau hinh he thong co ban\n"
printf "5. Cai dat bootloader\n"
printf "6. Cai dat them phan mem can thiet\n"
printf "7. Hoan tat va khoi dong lai\n"
echo "Nhan phim bat ky de tiep tuc..."
read -n 1 -s

# Run install filesystem script
clear
bash filesystem.bash
sleep 3
printf "\t==============================================
\t=       INSTALL ARCH LINUX AUTOMATION        =
\t==============================================\n"

printf "Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap"
printf "\nCac tien trinh se duoc dien ra:\n"
echo -e "1. Phan vung o dia -> \033[35mHoan tat!\033[0m\n"
printf "2. Cai dat he thong file len o dia\n -> \033[35mHoan tat!\033[0m\n"
printf "3. Cai dat he dieu hanh Arch Linux\n"
printf "4. Cau hinh he thong co ban\n"
printf "5. Cai dat bootloader\n"
printf "6. Cai dat them phan mem can thiet\n"
printf "7. Hoan tat va khoi dong lai\n"
echo "Nhan phim bat ky de tiep tuc..."
read -n 1 -s

clear
highlight 31 "Truy cap vao he thong moi\n"
sleep 5

arch-chroot /mnt bash chroot-script/