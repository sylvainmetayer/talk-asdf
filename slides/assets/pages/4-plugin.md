## Création d'un plugin en 5min

TODO Image montre en main

,,,

## Structure d'un plugin

<https://github.com/asdf-vm/asdf-plugin-template>

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

```bash [2-9|11-13]
# lib/utils.bash
download_release() {
 local version filename url
 version="$1"
 filename="$2"
 url="$GH_REPO/releases/download/v${version}/ytt-$(get_platform)-$(get_arch)"
 echo "* Downloading $TOOL_NAME release $version..."
 curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

# bin/download
release_file="$ASDF_DOWNLOAD_PATH/$TOOL_NAME"
download_release "$ASDF_INSTALL_VERSION" "$release_file"
```

,,,

`bin/install`

```bash [7-10|13-14]
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

#bin/install
chmod +x "$ASDF_DOWNLOAD_PATH/$TOOL_NAME"
install_version "$ASDF_INSTALL_TYPE" "$ASDF_INSTALL_VERSION" "$ASDF_INSTALL_PATH"
```

,,,

`list-all`

```bash [3-4|8-10|14]
# lib/utils.bash
sort_versions() {
 sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
  LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
 git ls-remote --tags --refs "$GH_REPO" |
  grep -o 'refs/tags/.*' | cut -d/ -f3- |
  sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

# bin/list-all
list_all_versions | sort_versions | xargs echo
```

,,,

`latest-stable`

```bash []
# bin/latest-stable
redirect_url=$(curl "${curl_opts[@]}" "$GH_REPO/releases/latest" | sed -n -e "s|^location: *||p" | sed -n -e "s|\r||p")
```

```bash [4]
$ curl "$GH_REPO/releases/latest"
HTTP/2 302
server: GitHub.com
location: https://github.com/carvel-dev/ytt/releases/tag/v0.46.0
```

,,,

```bash [3-6]
version=
printf "redirect url: %s\n" "$redirect_url" >&2
if [[ "$redirect_url" == "$GH_REPO/releases" ]]; then
 version="$(list_all_versions | sort_versions | tail -n1 | xargs echo)"
else
 version="$(printf "%s\n" "$redirect_url" | sed 's|.*/tag/v\{0,1\}||')"
fi
printf "%s\n" "$version"
```

,,,

### Besoin de plus ?

<https://asdf-vm.com/plugins/create.html#scripts-overview>

,,,

## Testons ça

<https://github.com/sylvainmetayer/asdf-ytt>

```bash
$ ./2-plugin-demo.sh
```
