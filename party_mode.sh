#!/bin/bash

echo "🎢 Lancement du mode 'Manège'..."
echo "Appuie sur [CTRL+C] dans ce terminal pour arrêter le carnage."

# Tableau des rotations (0=0°, 1=90°, 2=180°, 3=270°)
rotations=(0 1 2 3)

# Boucle infinie
while true; do
    for r in "${rotations[@]}"; do
        # On récupère le nom de ton écran dynamiquement
        MONITOR=$(hyprctl monitors -j | jq -r '.[] | .name' | head -n 1)
        
        # On applique la rotation
        hyprctl keyword monitor "$MONITOR,preferred,auto,1,transform,$r"
        
        sleep 1
    done
done