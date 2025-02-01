#!/bin/bash
sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm \
sddm kitty fish ttf-hack-nerd ttf-jetbrains-mono-nerd rofi swaybg waybar \
dunst grim slurp \
networkmanager bluez bluez-utils blueman \
brightnessctl pipewire wireplumber pavucontrol pamixer \
fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5 \
dolphin nautilus unrar \
htop btop nvtop \
vim nano ranger ueberzug fzf \
firefox vlc

sudo cp ./environment /etc/
cp -r ./.config $HOME
cp -r ./.local $HOME

cd $HOME

mkdir Pictures 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S --noconfirm swaylock-effects cava microsoft-edge-stable-bin code-git docker 

# ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable sddm
sudo systemctl enable docker

echo "Installation complete. The system will now reboot."
sudo reboot
