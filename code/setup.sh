#!/usr/bin/env bash

. "$HOME/.asdf/asdf.sh"

asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs 21.7.2
asdf install nodejs 14.21.3
asdf global nodejs latest
asdf plugin add sops https://github.com/sylvainmetayer/asdf-sops.git
asdf install sops latest
asdf install sops 3.8.0

asdf plugin add asdf-plugin-manager https://github.com/asdf-community/asdf-plugin-manager.git
asdf plugin update asdf-plugin-manager v1.3.1
asdf install asdf-plugin-manager 1.3.1
asdf global asdf-plugin-manager 1.3.1
# asdf-plugin-manager version