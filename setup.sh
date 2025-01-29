#!/bin/bash
sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm sddm fish ttf-hack-nerd rofi swaybg bluez bluez-utils blueman brightnessctl pipewire wireplumber pavucontrol pamixer networkmanager fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5 neovim firefox ranger ueberzug nautilus fzf btop htop fastfetch vlc

sudo pacman -S --coconfirm qt5-wayland qt6-wayland hyprland xdg-desktop-portal-hyprland kitty polkit-kde-agent dunst grim slurp wofi dolphin unrar

sudo pacman -S --noconfirm dkms nvidia-open nvidia-open-dkms xorg-xinit

sudo cp ./environment /etc/
cp -r ./.config $HOME
cp -r ./.local $HOME

cd $HOME

mkdir Pictures 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S --noconfirm swaylock-effects cava code microsoft-edge-stable-bin

# ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# fastfetch config
git clone https://github.com/LierB/fastfetch.git ~/.config/fastfetch 
cp ~/.config/fastfetch/presets/nyarch.jsonc ~/.config/fastfetch/config.jsonc

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable sddm

echo "Installation complete. The system will now reboot."
sudo reboot
