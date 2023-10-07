#!/usr/bin/env bash

# https://www.baeldung.com/linux/check-variable-exists-in-list
function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    [[ "$LIST" =~ ($DELIMITER|^)$VALUE($DELIMITER|$) ]]
}

plugin_to_keep="age direnv fzf nodejs starship"

for i in $(asdf plugin-list); do
    if exists_in_list "$plugin_to_keep" " " "$i"; then
        echo "Keep plugin $i"
    else
        asdf plugin-remove "$i"
    fi
done


for i in $(asdf list nodejs); do asdf uninstall nodejs $i; done

asdf plugin remove nodejs
asdf plugin add nodejs
asdf install nodejs latest
asdf install nodejs 14.21.3
asdf install nodejs 18.18.0
