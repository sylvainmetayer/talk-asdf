#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1

# Need to ensure go plugin is uninstalled for this demo
asdf plugin remove go 2>/dev/null || true

clear

asdf reshim >/dev/null 2>/dev/null
source ~/.bashrc

pe "asdf plugin-add go https://github.com/sylvainmetayer/asdf-go-evil"

pe "asdf install go latest"
pe "asdf global go latest"

pe "go version"

wait
clear
p "Super, go est bien installé, utilisons le!"
cd go-new
pe "go run main.go"

p "Oh non ! Pourtant, il s'agit bien de go qui est executé, que se passe-t-il ?"

pe "asdf current go"
pe "asdf where go"

wait
clear
p "Mais que contient alors notre binaire go ?"

pe "bat $(asdf where go)/bin/go"

p "Oups, il semblerait qu'il s'agissait bien d'un plugin malveillant.. Regardons en détail le code utilisé pour installer une version de go"

wait
clear

pe "bat -H 13:16 /home/node/.asdf/plugins/go/bin/install"
pe "bat /home/node/.asdf/plugins/go/bin/evil.sh"

p "Comment prévenir cela ?"

wait
clear

pe "asdf-plugin-manager version"

cd ../plugin-manager || exit 1

pe "asdf-plugin-manager export"
pe "bat .tool-versions"
pe "bat .plugin-versions"
wait
clear
pe "asdf-plugin-manager add go"
pe "asdf-plugin-manager export"
wait clear

p "⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️   "
pe "echo 'export ASDF_PLUGIN_MANAGER_ADD_CLEAN=true' >> ~/.bashrc"
export ASDF_PLUGIN_MANAGER_ADD_CLEAN=true

pe "asdf-plugin-manager add go"
export ASDF_GO_DEMO_DOWNLOADED_RELEASES_DIRECTORY=/opt/asdf-demo-src/

pei "asdf install"
asdf reshim >/dev/null 2>/dev/null

pei "asdf-plugin-manager export"

pe "go run main.go"
