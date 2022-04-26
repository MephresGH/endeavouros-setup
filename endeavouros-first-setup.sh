printf "Starting the setup script...\n";
sleep 1;
sudo pacman -Rsc yay;
sudo pacman -Rsc xfce4-terminal;
sudo pacman -Rsc konsole;
sudo pacman -S yay;
yay -Syu;
sudo pacman -Syu;
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader steam obs-studio gamemode discord;
sudo pacman -S --needed plasma;
sudo pacman -S --needed shotcut obs-studio;
sudo pacman -S --needed ark;
yay --needed goverlay;
yay --needed mangohud;
yay --needed lutris-git;
sudo pacman -S --needed fish;
sudo pacman -S --needed alacritty;
chmod 755 alacritty/alacritty.yml;
cp -r alacritty ~/.config;
sudo cp Xwrapper.config /etc/X11;
sudo cp xorg.conf /etc/X11/xorg.conf;
cp autostart.sh ~/.config/autostart-scripts;
sudo rm /etc/X11/xinit/xinitrc && sudo cp xinitrc /etc/X11/xinit;
set -U fish_greeting "Just a small fish, nothing else. 🐟";
echo DOASSUDO set -U fish_greeting "I'm the admin, let me through! <(((''>";
sudo pacman -S --needed pipewire pipewire-pulse pipewire-jack pipewire-alsa lib32-pipewire lib32-pipewire-jack;
yay -Yc;
sudo nano /etc/default/grub;
grub-mkconfig -o /boot/grub/grub.cfg && mkinitcpio -P;
./Arch-Clear.sh
