#!/bin/sh
echo "This script will set up your Arch Linux distribution."
echo "Interrupting this script might cause unexpected behavior and could require advanced troubleshooting."
echo "Caution is advised when running the script or attempting to change its contents."
echo "The script will start in 5 seconds..."
sleep 5;
printf "Starting the setup script...\n"
sleep 1;
echo "Updating Arch keyring..."
sudo pacman -S --needed archlinux-keyring;
echo "Updating System Services..."
sudo pacman -Syu;
echo "Installing AUR: yay..."
sudo pacman -Sy yay;
echo "Uninstalling Terminals..."
sudo pacman -Rsc xfce4-terminal konsole;
echo "Installing Fish Shell And Alacritty Terminal..."
sudo pacman -S --needed fish alacritty;
echo "Installing NVIDIA Drivers And Game-Related Programs..."
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader dkms steam gamemode discord;
echo "Installing KDE Plasma..."
sudo pacman -S --needed plasma-desktop;
sudo pacman -S --needed plasma-nm ark plasma-pa kscreen kinfocenter powerdevil dolphin kde-gtk-config xdg-desktop-portal xdg-desktop-portal-kde flameshot mpv bleachbit feh;
echo "Uninstalling XFCE And Login Managers..."
sudo systemctl disable lightdm.service;
sudo pacman -Rsc xfce4;
sudo pacman -Rsc lightdm gdm sddm firewalld;
echo "Installing Video Production Tools..."
sudo pacman -S --needed shotcut obs-studio audacity;
echo "Installing Wine Testing Build..."
sudo pacman -S --needed wine-staging;
echo "Installing Pipewire And Removing Pulseaudio..."
sudo pacman -S --needed pipewire pipewire-pulse pipewire-jack pipewire-alsa lib32-pipewire lib32-pipewire-jack wireplumber;
sudo pacman -Rsc pulseaudio;
echo "Updating AUR And Misc. Installations..."
yay -Syu;
yay goverlay;
yay mangohud;
yay lutris-git;
echo "Performing QoL Commands..."
cp "~/Downloads/Setup/autostart.sh" "~/.config/autostart-scripts";
cp -r "~/Downloads/Setup/alacritty ~/.config";
cp -r "~/Downloads/Setup/obs-studio" "~/.config";
cp -r "~/Downloads/Setup/bleachbit" "~/.config";
cp -r "~/Downloads/Setup/extensions" "~/.mozilla/extensions";
cp -r "~/Downloads/Setup/lutris ~/.config";
mkdir "~/.config/autostart-scripts";
mkdir "~/.config/mpv";
mkdir "~/.config/fish";
sudo mkdir "/root/.config/fish";
sudo rm "/etc/X11/xinit/xinitrc" && sudo cp "~/Downloads/Setup/xinitrc /etc/X11/xinit";
printf "loop-playlist=inf\nloop-file=inf" | tee "~/.config/mpv/mpv.conf";
printf "needs_root_rights=yes\nallowed_users=anybody" | sudo tee "/etc/X11/Xwrapper.config";
echo "set -U fish_greeting Just a small fish, nothing else. 🐟" | tee "~/.config/fish/config.fish";
echo "set -U fish_greeting I´m the admin, let me through!" | sudo tee "/root/.config/fish/config.fish";
sudo nano /etc/default/grub;
sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo mkinitcpio -P;
~/Downloads/Setup/Arch-Clear.sh;
echo "The script was run successfully."
read -p "Do you want to restart the system? (Y/n) " yn
case $yn in
        [Yy]* ) echo "Shutting down in 3 seconds..." && sleep 3 && shutdown -r now;;
        [Nn]* ) echo "Restart aborted, shut down the computer manually for proper operation." && exit;;
        * ) echo "Incorrect input detected. Repeating prompt...";;
    esac
