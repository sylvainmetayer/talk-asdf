#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

pe 'asdf plugin test ytt https://github.com/sylvainmetayer/asdf-ytt.git "ytt --version"'

pei 'asdf plugin add ytt https://github.com/sylvainmetayer/asdf-ytt.git'

pe 'asdf list-all ytt'

pe 'asdf install ytt latest'

pei 'asdf global ytt latest'

pei 'ytt --version'

pei 'asdf install ytt 0.45.0'
pe 'asdf shell ytt 0.45.0'

pei 'ytt --version'

p ""
