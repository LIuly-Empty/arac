#!/bin/bash
clear
echo ">>> Bat dau cau hinh chroot..."
sleep 5

pacman -Sy sudo xorg xorg-xinit vim networkmanager 

echo "Chon GUI: "
echo "1. XFCE"
echo "2. GNOME"
echo "3. KDE"
echo "4. LXDE"
echo "5. MATE"

read -p "Lua chon GUI (1-5): " gui_choice

case $gui_choice in
    1)
        pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter --noconfirm
        systemctl enable lightdm
        ;;
    2)
        pacman -S gnome gnome-extra gdm --noconfirm
        systemctl enable gdm
        ;;
    3)
        pacman -S plasma kde-applications sddm --noconfirm
        systemctl enable sddm
        ;;
    4)
        pacman -S lxde lxdm --noconfirm
        systemctl enable lxdm
        ;;
    5)
        pacman -S mate mate-extra lightdm lightdm-gtk-greeter --noconfirm
        systemctl enable lightdm
        ;;
    *)
        echo "Lua chon khong hop le. Khong cai dat GUI."
        ;;
esac

echo "Chon card do hoa de cai dat driver:"
echo "1. Intel"
echo "2. NVIDIA"
echo "3. AMD"
read -p "Lua chon (1-3): " gpu_choice
case $gpu_choice in
    1)
        pacman -S xf86-video-intel --noconfirm
        ;;
    2)
        pacman -S nvidia nvidia-utils nvidia-settings --noconfirm
        ;;
    3)
        pacman -S xf86-video-amdgpu --noconfirm
        ;;
    *)
        echo "Lua chon khong hop le. Khong cai dat driver do hoa."
        ;;
esac

echo ">>> Hoan tat cau hinh chroot."

