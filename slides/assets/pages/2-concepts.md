## Plugins

```shell
asdf plugin-add <plugin-name> <optional-repo-url>
```

<https://github.com/asdf-vm/asdf-plugins> <!-- .element: class="fragment" -->

<img src="assets/img/community.png" alt="ASDF community plugin"><!-- .element: class="fragment" -->


speaker:

Permet l'installation d'un plugin pour gérer les versions d'un outil.

,,,

## .tool-versions

```shell
$ cat .tool-versions
nodejs 14.21.3
```

<!-- <span class="img_background" style="--top: 300%; --left: 110%; --width: 100px; --height: 500px; ----cover: auto; --image: url('assets/img/illustrations/crop/Devfest_2023_Affiche_Principal_Couleur_garden.png')"></span> -->

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
$ ls ~/.asdf/shims/
node                      npm                       npx

$ cat ~/.asdf/shims/node
#!/usr/bin/env bash
exec /home/s.metayer/.asdf/bin/asdf exec "node" "$@"

$ ls ~/.asdf/installs/nodejs/20.8.1/bin -al
node
npm -> ../lib/node_modules/npm/bin/npm-cli.js
npx -> ../lib/node_modules/npm/bin/npx-cli.js
```

speaker: Le dossier ~/.asdf/shims contient les binaires de la versions actuelles.
Ces scripts sont des wrappers qui permettent de déterminer dynamiquement (selon le dossier ~/.tool-versions...) la version à utiliser. Ensuite, le binaire est appelé depuis le dossier ~/.asdf/install/<tool>/<version>/bin/<bin>
