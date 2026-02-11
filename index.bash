#!/bin/bash
clear

source src/color.bash

# Animated rainbow text
text="==============================================
=       INSTALL ARCH LINUX AUTOMATION        =
=============================================="
colors=(31 33 32 36 34 35) 

for ((i=0; i<${#text}; i++)); do
    color=${colors[$((i % ${#colors[@]}))]}
    printf "\e[1;${color}m%s\e[0m" "${text:$i:1}"
    sleep 0.1
done
echo

printf "\n${TX_GREEN}Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap${TX_NC}"
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
    clear
    exit 0
fi
printf "\nBat dau cai dat...\n"
clear

# Run partition script
cd archiso-script
bash partition.bash
sleep 3

# art: Animated rainbow text
art="==============================================
=       INSTALL ARCH LINUX AUTOMATION        =
=============================================="
colors=(31 33 32 36 34 35) 

for ((i=0; i<${#art}; i++)); do
    color=${colors[$((i % ${#colors[@]}))]}
    printf "\e[1;${color}m%s\e[0m" "${art:$i:1}"
    sleep 0.1
done
echo

printf "Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap"
printf "\nCac tien trinh se duoc dien ra:\n"

text="Phan vung o dia -> Hoan tat!" 
colors=(31 32 33 34 35 36) # đỏ, xanh lá, vàng, xanh dương, tím, cyan 
for ((i=0; i<${#text}; i++)); do 
    for color in "${colors[@]}"; do 
        printf "\r\e[${color}m%s\e[0m" "${text:$i:1}" 
        sleep 0.05 
    done 
    printf "%s" "${text:$i:1}" # giữ ký tự cuối cùng 
done 

echo -e "\n${TX_CYAN}Nhan phim bat ki de tiep tuc\n"
read -n 1 -s

# Run install filesystem script
clear
cd archiso-script
bash filesystem.bash
sleep 3
printf "\t==============================================
\t=       INSTALL ARCH LINUX AUTOMATION        =
\t==============================================\n"

printf "Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap"
printf "\nCac tien trinh se duoc dien ra:\n"


text="Cai dat he thong file len o dia -> Hoan tat!" 
colors=(31 32 33 34 35 36) # đỏ, xanh lá, vàng, xanh dương, tím, cyan 
for ((i=0; i<${#text}; i++)); do 
    for color in "${colors[@]}"; do 
        printf "\r\e[${color}m%s\e[0m" "${text:$i:1}" 
        sleep 0.05 
    done 
    printf "%s" "${text:$i:1}" # giữ ký tự cuối cùng 
done 

echo -e "\n${TX_CYAN}Nhan phim bat ki de tiep tuc\n"
read -n 1 -s

clear
highlight 31 "Truy cap vao he thong moi\n"
cp arac/chroot-script/chroot-system.bash /mnt/root/chroot-system.bash

sleep 5

arch-chroot /mnt bash root/chroot-system.bash