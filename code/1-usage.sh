#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

source ~/.bashrc

echo "Installation du plugin nodejs"

p 'asdf plugin add nodejs'

p "Lister les versions disponibles"

p 'asdf list-all nodejs'

sleep 1 && cat cheats/asdf_list_all_nodejs.txt

p 'Installer une version spécifique'

p 'asdf install nodejs 14.21.3'

sleep 2 && cat cheats/asdf_install_node_14.txt

p 'Lister les versions installées'

pei 'asdf list nodejs'

p 'Pour ceux qui veulent la dernière version'

p 'asdf install nodejs latest'

sleep 2 && cat cheats/asdf_install_node_latest.txt

pei 'asdf global nodejs latest'

p 'Voyons voir si on peut lancer notre code'

cd node14
pwd

rm .tool-versions> /dev/null 2>/dev/null || true

p "Quelle est la version actuellement définie ?"

pei 'asdf current nodejs'

pei 'node -v'

p "Il nous faut du node 14 ici !"

clear

pei 'asdf local nodejs 14.21.3'

pei 'bat .tool-versions'

pe 'npm start'

rm .tool-versions> /dev/null 2>/dev/null || true

p 'Et si on testait notre autre code sur une autre version ?'

clear

cd ../node21
pwd

pe 'npm start'

p 'Et avec du node 18 ?'

pe 'asdf shell nodejs 18.18.0'

pe 'npm start'

p ""
