#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

source ~/.bashrc

echo "Installation du plugin go"

p 'asdf plugin add go'

p "Lister les versions disponibles"

p 'asdf list-all go'

sleep 1 && cat cheats/asdf_list_all_golang.txt

wait
clear

export ASDF_GO_DEMO_DOWNLOADED_RELEASES_DIRECTORY=/opt/asdf-demo-src/

pe "asdf install go latest"

pei "asdf list go"

p "Voyons voir si on peut lancer notre code"
cd go-old

rm .tool-versions 2>/dev/null || true

pe "go run main.go"

p "Oups, il faut définir une version globale pour l'utiliser sans .tool-versions !"
pei "asdf global go latest"
pei "go run main.go"

p "Nous avons besoin d'une version de go spécifique ici !"
pe "echo 'go 1.16.15' > .tool-versions"

pei "go run main.go"

p "Ah oui, il faut installer la version d'abord !"

pe "asdf install"
pei "go run main.go"

p "Et maintenant, testons sur un autre code, sans contrainte particulière"

cd ../go-new

pei "ls -ail"
p "Pas de .tool-versions ici, on utilise alors la version globale située dans ~/.tool-versions"
pe "asdf current go"
pe "go run main.go"
