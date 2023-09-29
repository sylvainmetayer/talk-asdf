# Concepts

,,,

## Plugins

Permet l'installation d'un plugin pour gérer les versions d'un outil.

```shell
asdf plugin-add <plugin-name> <optional-repo-url>
```

,,,

## .tool-versions

Définit les versions souhaitées d'un ou plusieurs outil(s).

```shell
$ cat .tool-versions
nodejs 14.21.3
```

,,,

## Local vs Global

TODO : image carte

```text
./
├── slides/
│   ├── assets/
│   │   ├── code/
│   │   │   ├── node14/
│   │   │   │   └── .tool-versions
│   │   │   └── node18/
│   │   │       └── .tool-versions
├── .tool-versions

```

,,,

## Installation d'une version

```shell
asdf install <plugin> <version>
asdf install nodejs 14.21.3
asdf install
```
