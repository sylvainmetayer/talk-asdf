#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

source ~/.bashrc

p 'asdf plugin test sops https://github.com/sylvainmetayer/asdf-sops.git "sops -v"'

sleep 2 && cat cheats/sops_plugin_test.txt

p 'asdf plugin add sops https://github.com/sylvainmetayer/asdf-sops.git'

p 'asdf list-all sops'

sleep 1 && cat cheats/sops_list_all.txt

p 'asdf install sops latest'

cat cheats/sops_install_latest.txt

pei 'asdf global sops latest'

pei 'sops --version'

p 'asdf install sops 3.8.0'

cat cheats/sops_install_3.8.0.txt

# FIXME Shell integration is broken with demo-magic, need to fake it.
p 'asdf shell sops 3.8.0'
p 'sops -v'

cat cheats/sops_shell_3.8.0.txt

p ""
