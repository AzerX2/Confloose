#!/bin/bash

# Couleurs pour le style
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}⚠️  Suppression de la config Comfy-Hyprland...${NC}"

# 1. Suppression des fichiers de config
echo -e "${RED}🗑️  Suppression des fichiers de configuration...${NC}"
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty/kitty.conf
# On ne supprime pas tout le dossier kitty au cas où tu aurais d'autres trucs dedans
rm -rf ~/.config/waybar

# 2. Option de désinstallation des paquets
read -p "Voulez-vous aussi désinstaller les paquets (Hyprland, Kitty, Wofi, etc.) ? [y/N] " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo -e "${RED}📦 Désinstallation des paquets...${NC}"
    sudo pacman -Rs hyprland kitty wofi waybar hyprpaper ttf-font-awesome
else
    echo -e "${YELLOW}ℹ️  Paquets conservés, seules les configs ont été supprimées.${NC}"
fi

echo -e "${RED}✨ Nettoyage terminé !${NC}"