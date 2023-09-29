## Plugins

```shell
asdf plugin-add <plugin-name> <optional-repo-url>
```

speaker:

Permet l'installation d'un plugin pour gérer les versions d'un outil.

,,,

## .tool-versions

```shell
$ cat .tool-versions
nodejs 14.21.3
```

speaker:

Définit les versions souhaitées d'un ou plusieurs outil(s).

On peut/doit commit ce fichier au même titre que le gitignore

,,,

## Local vs Global

TODO : image carte

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
