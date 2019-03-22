#!/bin/sh

if !(type "yay" > /dev/null 2>&1); then
    git clone https://aur.archlinux.org/yay.git
    cd yay; makepkg -si --noconfirm
    rm -rf yay
fi

yay -Syu --noconfirm `cat yaylist | xargs`

for f in scripts/*.sh; do
    sh $f
done
