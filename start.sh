#
#!/usr/bin/env bash

##
## Percorrendo configs e criando links
HO=( ".gitconfig" ".gitconfig.local" ".gitignore" ".zshrc")
for file in "${HO[@]}"
do
    if [[ -f "$PWD/home-symbolics/$file" ]]; then
        if [[ -f "$HOME/$file" ]]; then
            rm -rf "$HOME/$file"

        elif [[ -L "$HOME/$file" ]]; then
            rm -rf "$HOME/$file"
        fi

        ln -s "$PWD/home-symbolics/$file" "$HOME/$file"
    fi
done
