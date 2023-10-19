#!/usr/bin/env bash

echo "- Mode Ne Pas Deranger actif ?"
echo "- Check vite fait que le raccourci zoom/dezoom fonctionne sur guake"
echo "- Lance le script clean.sh"
echo "- T'as une souris ?"

echo "Battery saver"
sudo systemctl stop docker.service
sudo systemctl stop cbagentd.service
sudo systemctl stop forticlient.service

echo "Clean"
kubectx -u || true

echo "Les images marchent pas sur le site github.io, utilise http://localhost:8000/"

