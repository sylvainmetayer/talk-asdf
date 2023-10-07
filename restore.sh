#!/usr/bin/env bash

BACKUP_FILE=~/asdf_backup.plugins.txt

while read p; do
    tool=$(echo "$p" | cut -d" " -f 1)
    url=$(echo "$p" | cut -d" " -f 2- | xargs)
    asdf plugin-add $tool $url
done <$BACKUP_FILE

cd
asdf install
cd -
