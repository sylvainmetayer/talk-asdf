## Création d'un plugin en moins de 10min

<img src="assets/img/clock.webp" alt="Clock">

,,,

## Création d'un plugin

`ytt` : YAML templating tool that works on YAML structure instead of text

<https://github.com/carvel-dev/ytt>

,,,

## Création d'un plugin

<https://github.com/asdf-vm/asdf-plugin-template>

<img src="assets/img/template.png" alt="Template Github">

```bash
asdf plugin-add github-cli && asdf install github-cli latest && asdf global github-cli latest
gh repo create asdf-ytt --template asdf-vm/asdf-plugin-template --public
git clone git@github.com:sylvainmetayer/asdf-ytt.git
```

,,,

`bash setup.bash`

```shell
[...]
Setting up plugin: asdf-ytt
author:        Sylvain METAYER
plugin repo:   https://github.com/sylvainmetayer/asdf-ytt
license:       https://choosealicense.com/licenses/mit/

ytt github:   https://github.com/carvel-dev/ytt/
ytt docs:     https://github.com/carvel-dev/ytt/
ytt test:     `ytt --version`

After confirmation, the `main` will be replaced with the generated
template using the above information. Please ensure all seems correct.
Type `yes` if you want to continue.
```

`git push --force-with-lease && git grep TODO`

,,,

## Structure d'un plugin

```shell
.
├── bin
│   ├── download
│   ├── install
│   ├── latest-stable
│   └── list-all
├── lib
│   └── utils.bash
├── LICENSE
├── README.md
```

,,,

`lib/utils.bash`

```bash []
GH_REPO="https://github.com/carvel-dev/ytt"
TOOL_NAME="ytt"
TOOL_TEST="ytt --version"

sort_versions() { /* ... */ }

list_github_tags() { /* ... */ }

list_all_versions() {/* ... */ }

download_release() {/* ... */ }

install_version() {/* ... */ }
```

,,,

`bin/download`

```bash [1-3|10|12]
# bin/download
release_file="$ASDF_DOWNLOAD_PATH/$TOOL_NAME"
download_release "$ASDF_INSTALL_VERSION" "$release_file"

# lib/utils.bash
download_release() {
 local version filename url
 version="$1"
 filename="$2"
 url="$GH_REPO/releases/download/v${version}/ytt-$(get_platform)-$(get_arch)"
 echo "* Downloading $TOOL_NAME release $version..."
 curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}
```

,,,

`bin/install`

```bash [1-3|11-13]
#bin/install
chmod +x "$ASDF_DOWNLOAD_PATH/$TOOL_NAME"
install_version "$ASDF_INSTALL_TYPE" "$ASDF_INSTALL_VERSION" "$ASDF_INSTALL_PATH"

# lib/utils.bash
install_version() {
 local install_type="$1"
 local version="$2"
 local install_path="${3%/bin}/bin"
 mkdir -p "$install_path"
 cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"
 test -x "$install_path/$TOOL_NAME" || fail "Expected $install_path/$TOOL_NAME to be executable."
 echo "$TOOL_NAME $version installation was successful!"
}
```

,,,

`list-all`

```bash [1-2|7-13|5]
# bin/list-all
list_all_versions | sort_versions | xargs echo

# lib/utils.bash
sort_versions() { /* regex magic */ }

list_all_versions() { list_github_tags }

list_github_tags() {
 git ls-remote --tags --refs "$GH_REPO" |
  grep -o 'refs/tags/.*' | cut -d/ -f3- |
  sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}
```

,,,

`latest-stable`

```bash []
# bin/latest-stable
redirect_url=$(curl -sI "$GH_REPO/releases/latest" | sed -n -e "s|^location: *||p" | sed -n -e "s|\r||p")
```

```bash [4]
$ curl "$GH_REPO/releases/latest"
HTTP/2 302
server: GitHub.com
location: https://github.com/carvel-dev/ytt/releases/tag/v0.46.0
```

speaker: Si header location avec n° version présent, on prends ça comme latest, sinon on prends la première du `list-all`

,,,

<!--
### Besoin de plus ?

<https://asdf-vm.com/plugins/create.html#scripts-overview>

-->

## Testons ça

<https://github.com/sylvainmetayer/asdf-ytt>

```bash
$ ./2-plugin-demo.sh
```

<span class="img_background" style="--top: 110%; --left: 350px; --width: 600px; --height: 500px; ----cover: auto; --image: url('assets/img/illustrations/crop/Devfest_2023_Affiche_Principal_Couleur_Trex.png')"></span>
