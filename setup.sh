#!/bin/bash
sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm \
sddm kitty ttf-hack-nerd ttf-jetbrains-mono-nerd rofi swaybg waybar \
dunst grim slurp \
networkmanager bluez bluez-utils blueman \
brightnessctl pipewire wireplumber pavucontrol pamixer \
fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5 \
dolphin nautilus unrar \
htop btop nvtop \
neovim nano ranger ueberzug fzf ark\
firefox vlc

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
cp ./.zshrc $HOME

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
