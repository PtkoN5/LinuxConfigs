#!/bin/bash

# --- Farben für die Ausgabe ---
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Starten der Installation...${NC}"

# 1. System Update
echo -e "${GREEN}Aktualisiere System...${NC}"
sudo pacman -Syu --noconfirm

# 2. Basis
if ! command -v yay &> /dev/null
then
    echo -e "${GREEN}Installiere git und yay...${NC}"
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm
    cd .. && rm -rf yay
fi

# Programme
PACKAGES=(
    # System & Terminal
    "git"
    "btop"
    "neovim"
    "fastfetch"
    
    # Internet & Kommunikation
    "zen-browser"
    "thunderbird"
    "localsend-bin"          # AUR
    
    # Office & Entwicklung
    "collabora-office-6.4-bin" # AUR 
    "r"                        # R-Lang
    "rstudio-desktop-bin"      # AUR 
    "jetbrains-toolbox"        # AUR
    "balena-etcher"            # AUR
)

echo -e "${GREEN}Installiere Pakete...${NC}"
yay -S --needed --noconfirm "${PACKAGES[@]}"

echo -e "${GREEN}Alle Programme wurden erfolgreich installiert!${NC}"
