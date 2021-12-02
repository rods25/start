#
#!/usr/bin/env bash

#############################################################################################
## Clonando GIT
#############################################################################################

GITREPOSDIRS=()
GITDIRS=()

if [[ -d "$GITPATH" ]]; then
    echo "Diretório GIT já existe: $GITPATH"
else
    mkdir -p $GITPATH
    echo "Diretório GIT criado: $GITPATH"
fi

for GITREPOKEY in "${!GITREPOSDIRS[@]}"
do
    if [[ -d "$GITPATH/${GITDIRS[$GITREPOKEY]}" ]]; then
        echo "GIT já clonado: $GITPATH/${GITDIRS[$GITREPOKEY]}"
    else
        ## Copiando svn
        cd $GITPATH
        git clone --recursive "ssh://git@stash.uol.intranet:7999/${GITREPOSDIRS[$GITREPOKEY]}" "${GITDIRS[$GITREPOKEY]}"
    fi
done

#############################################################################################
## SVN
#############################################################################################
SVNDIRS=()

for SVNDIR in "${SVNDIRS[@]}"
do
    if [[ -d "$SVNPATH/$SVNDIR" ]]; then
        echo "SVN já clonado: $SVNPATH/$SVNDIR"
        cd $SVNPATH/$SVNDIR
        svn up
    else
        ## Criando estrutura de pastas
        mkdir -p "$SVNPATH/$SVNDIR"
        rm -rf "$SVNPATH/$SVNDIR"

        ## Copiando svn
        svn checkout "https://publicador.svn.intranet/repository/$SVNDIR" "$SVNPATH/$SVNDIR"
    fi
done
