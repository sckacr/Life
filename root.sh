#!/bin/sh

cat <<"EOS"

               |
      __|  __| |  /  _` |  __|   __|
    \__ \ (      <  (   | (     |
    ____/\___|_|\_\\__,_|\___| _|

EOS

echo "$(shuf -n 1 ./characters)" >> /etc/hostname

echo "LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8" > /etc/locale.conf

echo "en_US.UTF-8 UTF-8
ja_JP.UTF-8 UTF-8" > /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock -wu

pacman -Syu --noconfirm `cat pacmanlist | xargs`
systemctl enable NetworkManager

passwd

useradd -m -G wheel -s /bin/zsh sckacr
passwd sckacr

sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' /etc/sudoers

bootctl --path=/boot install
echo "default arch
timeout 5" > /boot/loader/loader.conf
echo "title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=PARTUUID=$(blkid -s PARTUUID -o value $(lsblk -rpo NAME,MOUNTPOINT | awk '$2=="/"{print $1}'))" \
    > /boot/loader/entries/arch.conf
