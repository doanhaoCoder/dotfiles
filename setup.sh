#!/bin/bash
sudo pacman -Sy --noconfirm 
sudo pacman -Rns pipewire-pulse
sudo pacman -S --noconfirm sddm fish kitty ttf-hack-nerd rofi swaybg bluez bluez-utils blueman brightnessctl pulseaudio pulseaudio-bluetooth pavucontrol networkmanager fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5 neovim firefox dolphin fzf btop htop vlc

sudo cp ./environment /etc/
cp -r ./.config $HOME
cp -r ./.local $HOME

cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S --noconfirm swaylock-effects

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable sddm

echo "Installation complete. The system will now reboot."
sudo reboot
