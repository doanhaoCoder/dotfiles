#!/bin/bash

# https://github.com/doanhaoCoder
# https://www.youtube.com/@HaoNhat-zr4kn
# https://www.facebook.com/doanhao42

cat << "EOF"
 ____    ___    ___   _   _    _   _   ___    ___
|  _ \  / _ \  / _ \ | \ | |  | | | | / _ \  / _ \
| | | || | | || |_| ||  \| |  | |_| || |_| || | | |
| |_| || |_| ||  _  || |\  |  |  _  ||  _  || |_| |
|____/  \___/ |_| |_||_| \_|  |_| |_||_| |_| \___/

___________________SETUP_DOTFILES__________________
EOF

sudo pacman -Syu --noconfirm \
sddm \
i3-wm \
polybar \
i3lock \
feh \
kitty \
fish \
rofi \
flameshot \
otf-droid-nerd \
ttf-hack-nerd \
pipewire \
networkmanager \
picom \
pipewire-pulse \
pipewire-alsa \
pavucontrol \
python \
python3 \
nodejs \
xorg-xinput

# App for DoanHao
# List of packages to install
packages=(
  "code"
  "firefox"
  "dolphin"
  "kio-admin"
  "ranger"
  "vlc"
  "docker"
  "nano"
  "neofetch"
  "htop"
  "tree"
  "obs-studio"
  "telegram-desktop"
  "discord"
  "nvidia"
  # always use nvidia gpu
  # sudo nvidia-smi -pm 1
  "nvidia-utils"
  "nvtop"
  "gnome-disk-utility"
  "file-roller"
  "base-devel"
  # how to use build pkgfile
  # makepkg -si
  "btop"
  "virtualbox"
  "vim"
  "neovim"
)

# Ask for confirmation before installing
echo "Are you sure you want to install the following packages?"
for pkg in "${packages[@]}"; do
  echo "  - $pkg"
done

read -p "Install packages? (y/N): " confirmation
if [[ "$confirmation" == "y" ]]; then
  echo "Installing packages..."
  sudo pacman -S "${packages[@]}" --noconfirm
else
  echo "Installation has been cancelled."
fi

sudo systemctl enable sddm
sudo systemctl enable NetworkManager

cp -r ./.config "$HOME"
cp -r ./.local "$HOME"

echo "Setup successfully"

# Confirm system reboot
read -p "Do you want to reboot the system now? (y/N): " choice

case "$choice" in
    y|Y ) echo "Rebooting the system..."; sudo reboot;;
    n|N ) echo "Reboot canceled."; exit 0;;
    * ) echo "Invalid choice. Reboot canceled."; exit 1;;
esac
