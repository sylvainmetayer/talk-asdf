#!/usr/bin/env bash

source ./.demo-magic.sh -d || exit 1
clear

p '2 projets node que tout sépare'

pei 'node -v'

cd node21
pwd

pe 'npm start'

p 'Malheureusement, un vieux projet traine dans le coin...'

clear

cd ../node14
pwd

p "npm start"

npm start || true

p 'Que faire ?'
