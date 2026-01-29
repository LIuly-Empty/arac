#!/bin/bash
clear
printf "\t==============================================
\t=       INSTALL ARCH LINUX AUTOMATION        =
\t==============================================\n"

printf "Khi chay script nay, no se chay cho den khi hoan tat viec cai dat va dang nhap"
printf "\nBan co muon tiep tuc khong? (y/n): "
read choice
if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    printf "Thoat khoi script cai dat.\n"
    exit 0
fi
printf "\nBat dau cai dat...\n"
clear
echo -n "Đang xử lý " 
for i in {1..5}; do 
    for s in / - \\ \|; do 
        printf "\rĐang xử lý $s" 
        sleep 0.2 
    done 
done

clear

cd scripts
bash partition.bash

