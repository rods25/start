#
#!/usr/bin/env bash

##
## Instalando packs para dev
PACKS=( 
    "subversion" 
    "terminator" 
    "snapd" 
    "nginx"
    "npm"
    "zsh"
)
for APPS in "${PACKS[@]}"
do
    sudo apt-get install $APPS
done

##
## Instalando snaps
SNAPPACKS=( 
    "snapcraft" 
    "code --classic" 
    "node --channel=8/stable --classic" 
    "spotify" 
    "slack --classic" 
    "rambox"
)
for SNAPS in "${SNAPPACKS[@]}"
do
    sudo snap install $SNAPS
done

##
## Instalando ZSH e NVM
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash


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