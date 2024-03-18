#!/usr/bin/env bash

. "$HOME/.asdf/asdf.sh"

asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs 21.6.2
asdf install nodejs 14.21.3
asdf install nodejs 18.18.0
asdf global nodejs latest
asdf plugin add ytt https://github.com/sylvainmetayer/asdf-ytt.git
asdf install ytt latest
asdf install ytt 0.45.0
