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

if [[ -f zshPlugins.sh ]]; then
    zsh
else
    echo "Não encontrou zshPlugins"
fi

if [[ -f nginx.sh ]]; then
    bash nginx.sh
else
    echo "Não encontrou nginx"
fi