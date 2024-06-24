#!/usr/bin/env bash

echo "Silent mode is on?"
echo "Lance le script clean.sh"
echo "T'as coupé le son ??"
echo "Zoom depuis gnome-terminal : ctrl+p ctrl+m"
echo "T'as lancé le start.sh sur ta démo ?"
read -r

echo "Battery saver"
sudo systemctl stop cbagentd.service
sudo systemctl stop forticlient.service

kubectx -u || true

gnome-terminal --window-with-profile=demo --full-screen --working-directory "$(pwd)/code"
firefox -P work 'https://asdf.talks.sylvain.dev/devoxx2024'  'http://localhost:8000'
systemctl restart --user xremap
