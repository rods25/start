#
#!/usr/bin/env bash

PLUGINSREPODIR=(
    "zsh-users/zsh-syntax-highlighting.git"
    "zsh-users/zsh-autosuggestions"
)

PLUGINSDIR=(
    "zsh-syntax-highlighting"
    "zsh-autosuggestions"
)

for PLUGINSREPOKEY in "${!PLUGINSREPODIR[@]}"
do
    if [[ -d "$ZSH/custom/plugins/${PLUGINSDIR[$PLUGINSREPOKEY]}" ]]; then
        echo "Plugin: ${PLUGINSDIR[$PLUGINSREPOKEY]}"
    else
        ## Clonando plugins
        cd "$ZSH/custom/plugins"
        git clone "https://github.com/${PLUGINSREPODIR[$PLUGINSREPOKEY]}" "${PLUGINSDIR[$PLUGINSREPOKEY]}"
        echo "Finalizando download de ${PLUGINSDIR[$PLUGINSREPOKEY]}"
    fi
done