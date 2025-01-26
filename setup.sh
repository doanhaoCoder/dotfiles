#!/bin/bash
sudo pacman -Sy --noconfirm 
sudo pacman -S --noconfirm git sddm fish kitty ttf-hack-nerd rofi swaybg bluez bluez-utils brightnessctl pulseaudio pavucontrol networkmanager fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5 neovim firefox dolphin fzf btop htop vlc

sudo cp ./environment /etc/
sudo cp -r ./.config $HOME
sudo cp -r ./.local $HOME

cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S --noconfirm swaylock-effects

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm

echo "Installation complete. The system will now reboot."
sudo reboot