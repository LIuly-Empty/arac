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

highlight 32 "\t=============================================="
highlight 32 "\t=          INSTALL FILESYSTEM SCRIPT         ="
highlight 32 "\t=============================================="
printf "2. Cai dat he thong file len o dia\n"

#mount phan vung
clear
highlight 31 "Mount phan vung\n"
sleep 5
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot


# Cai filesystem
clear
highlight 31 "Cai dat filesystem\n"
sleep 5
pacstrap /mnt base linux linux-firmware vim nano sudo

# Tao file fstab
clear
highlight 31 "Tao file fstab\n"
sleep 5
genfstab -U /mnt >> /mnt/etc/fstab

# Truy cap vao he thong moi
clear
highlight 31 "Truy cap vao he thong moi\n"
sleep 5

