#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

source ~/.bashrc

p 'asdf plugin test go https://github.com/sylvainmetayer/asdf-go.git "go version"'

sleep 1 && cat cheats/go_plugin_test.txt

asdf plugin-remove go 2>/dev/null >/dev/null

pe 'asdf plugin add go https://github.com/sylvainmetayer/asdf-go.git'

clear

export ASDF_GO_DEMO_DOWNLOADED_RELEASES_DIRECTORY=/opt/asdf-demo-src/

pe 'asdf install go latest'

pei 'asdf global go latest'

pei 'go version'

wait
clear

cd go-old
pei "echo 'go 1.16.15' > .tool-versions"
pe 'asdf install go'

pei "go run main.go"
