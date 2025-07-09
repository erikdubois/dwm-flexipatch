#!/bin/bash
#clear; seq 1 94 | sort -R | sparklines | lolcat
make clean
make
sudo make install
make clean

mkdir -p "$HOME/.config/flexi"
cp -rv ./* "$HOME/.config/flexi/"

cp -rv ./powermenu/arcolinux-powermenu "$HOME/.bin/"

echo "Logout and login with flexi"