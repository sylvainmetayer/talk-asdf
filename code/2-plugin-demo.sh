#!/usr/bin/env bash

source ./.demo-magic.sh || exit 1
clear

source ~/.bashrc

p 'asdf plugin test ytt https://github.com/sylvainmetayer/asdf-ytt.git "ytt --version"'

sleep 2 && cat cheats/ytt_plugin_test.txt

p 'asdf plugin add ytt https://github.com/sylvainmetayer/asdf-ytt.git'

p 'asdf list-all ytt'

sleep 1 && cat cheats/ytt_list_all.txt

p 'asdf install ytt latest'

cat cheats/ytt_install_latest.txt

pei 'asdf global ytt latest'

pei 'ytt --version'

p 'asdf install ytt 0.45.0'

cat cheats/ytt_install_0.45.0.txt

pe 'asdf shell ytt 0.45.0'

pei 'ytt --version'

p ""
