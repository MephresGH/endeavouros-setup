#!/bin/bash
printf "Starting the setup script...";
sleep 1;
sudo pacman -Syu;
sudo pacman -Sy --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si;
sudo pacman -Sy --needed archlinux-keyring;
sudo pacman -Sy --needed fish;
sudo pacman -Sy --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader steam obs-studio gamemode discord;
sudo pacman -Sy --needed plasma-desktop plasma-nm plasma-pa kinfocenter powerdevil dolphin kde-gtk-config eog parole;
sudo pacman -Sy --needed shotcut;
sudo pacman -Sy --needed ark;
sudo pacman -Sy --needed wine-testing;
sudo pacman -Sy --needed pipewire pipewire-pulse pipewire-jack pipewire-alsa lib32-pipewire lib32-pipewire-jack;
yay -Syu;
yay --needed goverlay;
yay --needed mangohud;
yay --needed lutris-git;
cp -r alacritty ./config;
sudo cp Xwrapper.config /etc/X11;
sudo rm /etc/X11/xorg.conf;
sudo nano /etc/X11/xorg.conf;
cp autostart.sh ~/.config/autostart-scripts;
sudo rm /etc/X11/xinit/xinitrc && sudo cp xinitrc /etc/X11/xinit;
sudo nvidia-settings;
sudo nvidia-xconfig -a --cool-bits 28 && sudo nvidia-settings;
echo DOASSUDO set -U fish_greeting "I'm the admin, let me through! <(((''>";
yay -Yc;
sudo nano /etc/default/grub;
grub-mkconfig -o /boot/grub/grub.cfg && mkinitcpio -P;
./Arch-Clear.sh
