#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

source ~/.bashrc

p "Installation d'un plugin"

pe 'asdf plugin add nodejs'

p "Lister les versions disponibles"

pe 'asdf list-all nodejs'

p 'Installation une version donnée'

pei 'asdf install nodejs 14.21.3'

p 'Lister les versions installées'

pei 'asdf list nodejs'

p 'Pour ceux qui veulent la dernière version'

pei 'asdf install nodejs latest'

pei 'asdf global nodejs latest'

p 'Voyons voir si on peut lancer notre code'

cd node14
pwd
rm .tool-versions || true

p "J'ai quelle version actuellement ?"

pei 'asdf current nodejs'

p "Ce n'est pas la bonne, il me faut du node 14 ici !"

pei 'asdf local nodejs 14.21.3'

pe 'asdf install'

pe 'npm start'

rm .tool-versions || true

p 'Et si on testait notre autre code sur une autre version ?'

cd ../node18
pwd

pe 'npm start'
p ""
