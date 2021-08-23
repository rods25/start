#
#!/usr/bin/env bash

#############################################################################################
## Clonando GIT
#############################################################################################

GITREPOSDIRS=(
    "dcweb/commons.uol.com.br-monaco.git"
    "dcweb/commons.uol.com.br-sistemas.git"
    "dcweb/commons.uol.com.br-static.git"
    "dcweb/futebol.placar.esporte.bol.uol.com.br.git"
    "dcweb/futebol.placar.esporte.uol.com.br.git"
    "~gpaes/git-deploy.git"
    "~gpaes/criamt.git"
    "dcweb/placar.bol.uol.com.br.git"
    "dcweb/placar.uol.com.br.git"
    "dcweb/projeto-grafico-v2.git"
    "dcweb/projeto-grafico-v3.git"
    "~fjsilva/pgv3-cli.git"
    "dcweb/projeto-placar-esporte.git"
    "dcweb/publicador-resources-conteudo.git"
    "~d_gsoares/robocopier.git"
    "~llaraujo/tclink.git"
    "dcweb/www.bol.uol.com.br.git"
    "dcweb/www.bol.uol.com.br-calango-editorial.git"
    "dcweb/www.uol.com.br-camaleao-editorial.git"
    "dcweb/www.uol.com.br.git"
)
GITDIRS=(
    "commons.uol.com.br-monaco"
    "commons.uol.com.br-sistemas"
    "commons.uol.com.br-static"
    "futebol.placar.esporte.bol.uol.com.br"
    "futebol.placar.esporte.uol.com.br"
    "git-deploy"
    "criamt"
    "placar.bol.uol.com.br"
    "placar.uol.com.br"
    "projeto-grafico-v2"
    "projeto-grafico-v3"
    "pgv3-cli"
    "projeto-placar-esporte"
    "publicador-resources-conteudo"
    "robocopier"
    "tclink"
    "www.bol.uol.com.br"
    "www.bol.uol.com.br-calango-editorial"
    "www.uol.com.br-camaleao-editorial"
    "www.uol.com.br"
)

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
##SVNDIRS=(
##    "metatemplate"
##    "branches"
##    "include"
##    "resources"
##    "webcontent/br/com/uol/commons"
##    "webcontent/com/jsuol/c"
##    "webcontent/com/imguol/c"
##    "webcontent/com/stc/c"
##    "webcontent/br/com/uol/home2015"
##    "webcontent/br/com/bol/home"
##)
##
##for SVNDIR in "${SVNDIRS[@]}"
##do
##    if [[ -d "$SVNPATH/$SVNDIR" ]]; then
##        echo "SVN já clonado: $SVNPATH/$SVNDIR"
##        cd $SVNPATH/$SVNDIR
##        svn up
##    else
##        ## Criando estrutura de pastas
##        mkdir -p "$SVNPATH/$SVNDIR"
##        rm -rf "$SVNPATH/$SVNDIR"
##
##        ## Copiando svn
##        svn checkout "https://publicador.svn.intranet/repository/$SVNDIR" "$SVNPATH/$SVNDIR"
##    fi
##done

#############################################################################################
## SVN QA
#############################################################################################
##if [[ -d "$SVNQAPATH" ]]; then
##    echo "SVN já clonado: $SVNQAPATH"
##    cd $SVNQAPATH
##    svn up
##else
##    ## Criando estrutura de pastas
##    mkdir -p "$SVNQAPATH"
##    rm -rf "$SVNQAPATH"
##
##    ## Copiando svn
##    svn checkout "https://publicador.svn.qa.intranet/repository/" "$SVNQAPATH"
##fi

#############################################################################################
## Clonando TCL
#############################################################################################

if [[ -d "$TCLPATH" ]]; then
  echo "$TCLPATH já existe"
else
  cd $PG
  curl http://templatecache.qa.intranet/templatecache-local/tcl-installer.jar --output tcl-installer.jar
  java -jar tcl-installer.jar
  rm -rf tcl-installer.jar
fi
