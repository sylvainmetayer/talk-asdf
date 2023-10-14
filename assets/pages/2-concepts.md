## Plugins

```shell
asdf plugin-add <plugin-name> <optional-repo-url>
```

<https://github.com/asdf-vm/asdf-plugins>

<img src="assets/img/community.png" alt="ASDF community plugin">


speaker:

Permet l'installation d'un plugin pour gérer les versions d'un outil.

,,,

## .tool-versions

```shell
$ cat .tool-versions
nodejs 14.21.3
```

<span class="img_background" style="--top: 300%; --left: 110%; --width: 100px; --height: 500px; ----cover: auto; --image: url('/assets/img/illustrations/crop/Devfest_2023_Affiche_Principal_Couleur_garden.png')"></span>

speaker:

Définit les versions souhaitées d'un ou plusieurs outil(s).

On peut/doit commit ce fichier au même titre que le gitignore

,,,

## Installation d'une version

```shell
asdf install <plugin> <version>
asdf install nodejs 14.21.3
asdf install
```

,,,

## Local vs Global

```text
~/
├── slides/
│   ├── assets/
│   │   ├── code/
│   │   │   ├── node14/
│   │   │   │   └── .tool-versions
│   │   │   └── node18/
│   │   │       └── .tool-versions
├── .tool-versions
```

```bash
$ asdf global <outil> <version>
$ asdf local <outil> version>
```

,,,

## Shims

```bash
$ ls ~/.asdf/installs/nodejs/20.8.0/bin -al
node
npm -> ../lib/node_modules/npm/bin/npm-cli.js
npx -> ../lib/node_modules/npm/bin/npx-cli.js
yarn -> ../lib/node_modules/yarn/bin/yarn.js
yarnpkg -> ../lib/node_modules/yarn/bin/yarn.js

$ ls ~/.asdf/shims/
age                       age-keygen                aws                    go
node                      npm                       direnv                 npx
yarn                      ytt
```

speaker: Le dossier ~/.asdf/shims contient les binaires de la versions actuelles.
Lors d'un changement de .tool-versions / d'outil / de version, asdf fait un reshim des biniaires pour la versions donnée et l'outil donné, ce qui recré les fichiers dans le dossier ~/asdf/shims depuis le dossier ~/.asdf/install/<tool>/<version>/bin/
