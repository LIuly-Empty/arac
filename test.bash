#!/bin/bash
clear

colors=(31 33 32 36 34 35)  # đỏ, vàng, xanh lá, cyan, xanh dương, tím

for ((i=0; i<${#text}; i++)); do
    color=${colors[$((i % ${#colors[@]}))]}
    printf "\e[1;${color}m%s\e[0m" "${text:$i:1}"
    sleep 0.1
done

text="==============================================
=       INSTALL ARCH LINUX AUTOMATION        =
=============================================="
echo
echo -e "\n"
