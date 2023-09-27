#!/usr/bin/env bash

source ./demo-magic.sh || exit 1
clear


echo "commande cachée mais output visible"

pei "echo Commande simulée"

pe "asdf "

pe "asdf install"

# wait max 3 seconds until user presses
PROMPT_TIMEOUT=3
wait

pe "echo Après attente"

pei "echo Commande simulée immédiatement"

p ""
