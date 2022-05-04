#!/bin/sh
sudo rm -f /etc/X11/xorg.conf;
sudo nvidia-xconfig -a --cool-bits 28 && sudo nvidia-settings && nvidia-settings;
sudo nano /etc/X11/xorg.conf
