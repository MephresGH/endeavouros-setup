#!/bin/bash
printf "Starting the setup script...\n";
sleep 1;
echo Updating...
sudo pacman -Syu;
echo Installing AUR: yay...
sudo pacman -Rsc yay;
sudo pacman -Sy --needed yay;
echo Updating Arch keyring...
sudo pacman -Sy -needed archlinux-keyring;
echo Uninstalling Terminals...
sudo pacman -Rsc xfce4-terminal;
sudo pacman -Rsc konsole;
echo Installing Fish Shell And Alacritty Terminal...
sudo pacman -Sy --needed fish alacritty;
echo Installing NVIDIA Drivers...
sudo pacman -Sy --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader steam obs-studio gamemode discord;
echo Installing KDE Plasma...
sudo pacman -Sy --needed plasma-desktop plasma-nm ark plasma-pa kscreen kinfocenter powerdevil dolphin kde-gtk-config eog mpv;
echo Installing Video Production Tools...
sudo pacman -Sy --needed shotcut obs-studio audacity;
echo Installing Wine Testing Build...
sudo pacman -Sy --needed wine-testing;
echo Installing Pipewire...
sudo pacman -Sy --needed pipewire pipewire-pulse pipewire-jack pipewire-alsa lib32-pipewire lib32-pipewire-jack wireplumber;
echo Updating AUR And Misc. Installations...
yay -Syu;
yay --needed goverlay;
yay --needed mangohud;
yay --needed lutris-git;
echo Entering QoL Setup...
cp -r alacritty ~/.config;
sudo cp Xwrapper.config /etc/X11;
sudo rm /etc/X11/xorg.conf;
sudo nano /etc/X11/xorg.conf;
mkdir ~/.config/mpv;
printf "loop-playlist=inf\nloop-file=inf" | tee ~/.config/mpv/mpv.conf;
sudo nvidia-xconfig -a --cool-bits 28 && sudo nvidia-settings;
cp autostart.sh ~/.config/autostart-scripts;
sudo rm /etc/X11/xinit/xinitrc && sudo cp xinitrc /etc/X11/xinit;
set -U fish_greeting "Just a small fish, nothing else. 🐟";
echo "set -g fish_greeting I´m the admin, let me through!" | sudo tee /root/.config/fish/config.fish;
sudo nano /etc/default/grub;
grub-mkconfig -o /boot/grub/grub.cfg && mkinitcpio -P;
./Arch-Clear.sh
