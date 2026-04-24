#!/bin/bash

echo "🛠️  Remise en état du système..."

# 1. On cherche le script party_mode et on l'arrête brutalement
pkill -f party_mode.sh

# 2. On remet l'écran à l'endroit (transform 0)
# On applique la commande à tous les écrans connectés pour être sûr
hyprctl monitors -j | jq -r '.[] | .name' | while read monitor; do
    hyprctl keyword monitor "$monitor,preferred,auto,1,transform,0"
done

echo "✅ Tout est revenu à la normale. Respire !"