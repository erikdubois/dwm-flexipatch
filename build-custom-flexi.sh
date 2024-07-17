#!/bin/bash
#set -e
#set -x
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue

echo
tput setaf 2
echo "################################################################"
echo "BUILDING SCRIPT"
echo "################################################################"
tput sgr0
echo

#read -p "Do you want to get the scripts from the internet? (yes/y/Y or no/n/N) " user_choice
# Normalize user input to lowercase
#user_choice=$(echo "$user_choice" | tr '[:upper:]' '[:lower:]')

user_choice="n"

# install packages
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed arandr
sudo pacman -S --noconfirm --needed arcolinux-dwm-st-git
sudo pacman -S --noconfirm --needed arcolinux-nlogout-git
sudo pacman -S --noconfirm --needed arcolinux-powermenu-git
sudo pacman -S --noconfirm --needed btop
sudo pacman -S --noconfirm --needed dash
sudo pacman -S --noconfirm --needed dex
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed flameshot-git
sudo pacman -S --noconfirm --needed gnome-screenshot
sudo pacman -S --noconfirm --needed go
sudo pacman -S --noconfirm --needed imlib2
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed picom
sudo pacman -S --noconfirm --needed rofi-lbonn-wayland
sudo pacman -S --noconfirm --needed scrot
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed xfce4-screenshooter
sudo pacman -S --noconfirm --needed xorg-xrandr

# File management
if [ -d sysmon ] ; then
	sudo rm -r sysmon
fi

if [ ! -d ~/.config/flexi ]; then
	mkdir ~/.config/flexi
fi

# copying files to ~/.config/flexi
cp -v autostart.sh ~/.config/flexi
cp -v sxhkdrc ~/.config/flexi
cp -v picom-toggle.sh ~/.config/flexi
# copying folders to ~/.config/flexi
cp -rv launcher ~/.config/flexi
cp -rv scripts ~/.config/flexi
cp -rv picom ~/.config/flexi

echo
tput setaf 2
echo "################################################################"
echo "BUILDING DWM"
echo "################################################################"
tput sgr0
echo

# Building Flexi
sh rebuild.sh



echo
tput setaf 2
echo "################################################################"
echo "BUILDING SYSMON"
echo "################################################################"
tput sgr0
echo

# Building Sysmon
# https://github.com/blmayer/sysmon
echo "Adding sysmon"
git clone https://github.com/blmayer/sysmon
cp sysmon.sh sysmon
cd sysmon
sed -i 's|PREFIX=${HOME}/.local|PREFIX=/usr|' Makefile
sh sysmon.sh

if [ -f /usr/local/bin/var ];then
	/usr/local/bin/var
fi

echo
tput setaf 2
echo "################################################################"
echo "################################################################"
echo "################################################################"
echo "DONE - LOGOUT AND LOG INTO FLEXI"
echo "################################################################"
echo "################################################################"
echo "################################################################"
tput sgr0
echo
