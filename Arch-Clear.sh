#!/bin/bash
sudo pacman -Syu;
yay;
yes | sudo pacman -Sc;
yes | sudo pacman -Scc;
yes | yay -Sc;
yes | yay -Scc;
sudo pacman -Rns $(pacman -Qtdq);
sudo rm -rf /var/cache/pacman/pkg/*;
sudo rm -rf /tmp/*;
bleachbit;
sudo bleachbit;
nvidia-settings -a "GpuPowerMizerMode=1"
