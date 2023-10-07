#!/usr/bin/env bash

source ./.demo-magic.sh || exit 1
clear

p '2 projets node que tout sépare'

pei 'node -v'

cd node18
pwd

pe 'npm start'

p 'Malheureusement, un vieux projet est la...'

cd ../node14
pwd

p "npm start"

npm start || true

p 'Que faire ?'
