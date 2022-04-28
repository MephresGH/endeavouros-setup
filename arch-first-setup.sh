#!/bin/bash
printf "Starting the setup script...";
sleep 1;
sudo pacman -S --needed fish;
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si;
yay -Syu;
sudo pacman -Syu;
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader steam obs-studio gamemode discord;
sudo pacman -S --needed plasma;
sudo pacman -S --needed shotcut;
sudo pacman -S --needed ark;
yay --needed goverlay;
yay --needed mangohud;
yay --needed lutris-git;
sudo pacman -S --needed wine-testing;
cp -r alacritty ./config;
sudo cp Xwrapper.config /etc/X11;
sudo rm /etc/X11/xorg.conf;
sudo nvidia-settings;
sudo nvidia-xconfig -a --cool-bits 28 && sudo nvidia-settings;
sudo nano /etc/X11/xorg.conf;
cp autostart.sh ~/.config/autostart-scripts;
sudo rm /etc/X11/xinit/xinitrc && sudo cp xinitrc /etc/X11/xinit;
echo DOASSUDO set -U fish_greeting "I'm the admin, let me through! <(((''>";
sudo pacman -S --needed pipewire pipewire-pulse pipewire-jack pipewire-alsa lib32-pipewire lib32-pipewire-jack;
yay -Yc;
sudo nano /etc/default/grub;
grub-mkconfig -o /boot/grub/grub.cfg && mkinitcpio -P;
./Arch-Clear.sh
