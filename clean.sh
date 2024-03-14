#!/usr/bin/env bash

echo "Create a container with asdf and plugins installed and run theses into ?"
exit 1

# https://www.baeldung.com/linux/check-variable-exists-in-list
function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    [[ "$LIST" =~ ($DELIMITER|^)$VALUE($DELIMITER|$) ]]
}

plugin_to_keep="age direnv fzf nodejs starship"

# ensure to clean PS
kubectx -u

for i in $(asdf plugin-list); do
    if exists_in_list "$plugin_to_keep" " " "$i"; then
        echo "Keep plugin $i"
    else
        #asdf plugin-remove "$i"
        echo "Non, on clean plus à une heure de la démo!"
    fi
done

for i in $(asdf list nodejs); do asdf uninstall nodejs "$i"; done

asdf plugin remove nodejs
asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs 21.6.2
asdf install nodejs 14.21.3
asdf install nodejs 18.18.0
asdf global nodejs latest
asdf plugin add ytt https://github.com/sylvainmetayer/asdf-ytt.git
asdf install ytt latest
asdf install ytt 0.45.0
