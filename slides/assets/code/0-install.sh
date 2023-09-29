#!/usr/bin/env bash

source ./.demo-magic.sh || exit 1
clear

pei "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1"

pei 'echo . "$HOME/.asdf/asdf.sh" > ~/.bashrc '
pei 'echo . "$HOME/.asdf/completions/asdf.bash" > ~/.bashrc'

