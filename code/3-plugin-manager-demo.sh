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

wait
clear
p "Super, sops est bien installé, utilisons le!"
pe "sops"

p "Oh non ! Pourtant, il s'agit bien de sops qui est executé, que se passe-t-il ?"

pe "asdf current sops"
pe "asdf where sops"

wait
clear
p "Mais que contient alors notre binaire sops ?"

pe "bat $(asdf where sops)/bin/sops"

p "Oups, il semblerait qu'il s'agissait bien d'un plugin malveillant.. Regardons en détail le code utilisé pour télécharger une version de sops"

wait
clear

pe "bat /home/node/.asdf/plugins/sops/bin/download"
pe "bat /home/node/.asdf/plugins/sops/bin/evil.sh"

p "Comment prévenir cela ?"

wait
clear

# already done in setup.sh
#p "asdf plugin add asdf-plugin-manager https://github.com/asdf-community/asdf-plugin-manager.git"
#p "asdf plugin update asdf-plugin-manager v1.3.1"
#p "asdf install asdf-plugin-manager 1.3.1"
#pe "asdf global asdf-plugin-manager 1.3.1"

pe "asdf-plugin-manager version"

cd plugin-manager || exit 1

pe "asdf-plugin-manager export"
pe "bat .tool-versions"
pe "bat .plugin-versions"
pe "asdf-plugin-manager add-all"
pe "asdf-plugin-manager export"

p "⚠️ ⚠️ ⚠️"
pe "echo 'export ASDF_PLUGIN_MANAGER_ADD_CLEAN=true' >> ~/.bashrc"
export ASDF_PLUGIN_MANAGER_ADD_CLEAN=true

pe "asdf-plugin-manager update sops"
pe "asdf-plugin-manager export"

# TODO FIXME DEMO KO