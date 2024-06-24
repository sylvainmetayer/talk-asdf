#!/usr/bin/env bash

. "$HOME/.asdf/asdf.sh"

# pre-download release file
ASDF_GO_DEMO_DOWNLOADED_RELEASES_DIRECTORY=/opt/asdf-demo-src/
for VERSION in "1.16.15" "1.22.4"
do
    echo "pre-download go tar.gz version $VERSION"
    curl -sL -o $ASDF_GO_DEMO_DOWNLOADED_RELEASES_DIRECTORY/$VERSION.tar.gz https://go.dev/dl/go$VERSION.linux-amd64.tar.gz
done


asdf plugin add go https://github.com/sylvainmetayer/asdf-go.git

asdf plugin add asdf-plugin-manager https://github.com/asdf-community/asdf-plugin-manager.git
asdf plugin update asdf-plugin-manager v1.3.1
asdf install asdf-plugin-manager 1.3.1
asdf global asdf-plugin-manager 1.3.1

