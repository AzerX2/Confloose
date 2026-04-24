#!/bin/bash

# Couleurs pour le style
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Installation de la config Comfy-Hyprland...${NC}"

# 1. Mise à jour et installation des paquets
echo -e "${GREEN}📦 Installation des dépendances...${NC}"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm hyprland kitty wofi waybar hyprpaper ttf-font-awesome noto-fonts-emoji

# 2. Création des dossiers de config
echo -e "${GREEN}📂 Création des dossiers...${NC}"
mkdir -p ~/.config/hypr
mkdir -p ~/.config/kitty
mkdir -p ~/.config/waybar

# 3. Écriture de la config Hyprland
echo -e "${GREEN}✍️ Injection de la config hyprland.conf...${NC}"
cat <<EOF > ~/.config/hypr/hyprland.conf
# --- Config Comfy par Gemini ---
monitor=,preferred,auto,1

exec-once = waybar & hyprpaper

input {
    kb_layout = fr
    follow_mouse = 1
}

general {
    gaps_in = 8
    gaps_out = 15
    border_size = 3
    col.active_border = rgba(89b4faff) rgba(f5c2e7ff) 45deg
    col.inactive_border = rgba(585b70aa)
    layout = dwindle
}

decoration {
    rounding = 12
    blur {
        enabled = true
        size = 6
        passes = 2
    }
    drop_shadow = true
    shadow_range = 15
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = true
    bezier = bounce, 0.2, 0.9, 0.3, 1.05
    animation = windows, 1, 7, bounce, slide
    animation = workspaces, 1, 6, default, slidefade 20%
}

\$mainMod = SUPER
bind = \$mainMod, T, exec, kitty
bind = \$mainMod, Q, killactive, 
bind = \$mainMod, D, exec, wofi --show drun
bind = \$mainMod, E, exec, thunar
bind = \$mainMod, M, exit, 
bind = \$mainMod, left, movefocus, l
bind = \$mainMod, right, movefocus, r
bind = \$mainMod, up, movefocus, u
bind = \$mainMod, down, movefocus, d
EOF

# 4. Config rapide pour Kitty (Terminal)
cat <<EOF > ~/.config/kitty/kitty.conf
background_opacity 0.8
confirm_os_window_close 0
font_family Fira Code
EOF

echo -e "${BLUE}✅ Terminé ! Redémarre ou lance Hyprland.${NC}"