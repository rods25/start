## Projeto Start (Cinnamon) com as configs necessárias para o ambiente UOL.

Copie e cole o código abaixo em um editor e faça as alterações necessárias. Depois execute no terminal.

### Instalando packs para dev
```sh
echo ("Iniciando instalação dos pacotes")
PACKS=( 
    "git"
    "subversion" 
    "terminator" 
    "snapd" 
    "nginx"
    "npm"
    "zsh"
    "xclip"
)
for APPS in "${PACKS[@]}"
do
    sudo apt-get install $APPS
done

#
# Instalando snaps
SNAPPACKS=( 
    "snapcraft --classic" 
    "code --classic" 
    "node --channel=8/stable --classic" 
    "spotify" 
    "slack --classic" 
)
for SNAPS in "${SNAPPACKS[@]}"
do
    sudo snap install $SNAPS
done

#
# Instalando ZSH e NVM

sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

#
# Config git user
$ git config --global user.name "Rodrigo Santos"
$ git config --global user.email "rrfsantos@uolinc.com"

#
# Gerando Key SSH para o stash uol
ssh-keygen -t rsa -C "rrfsantos@uolinc.com"
xclip -selection clipboard < ~/.ssh/id_rsa.pub
echo "xclip ssh to stash, favor colar no seu ambiente"

#
# Após configurar o SSH Key no stash, clone o projeto START para $HOME/Documents/
cd $HOME/Documents/
git clone ssh://git@stash.uol.intranet:7999/~rrfsantos/start.git

```

### Para ambiente de dev ###
Executar "bash start.sh" no terminal.
O arquivo "start" configura e instala programas necessários para o desenvolvimento. 

### Para ambiente UOL ###
Execute "bash uol.sh" no terminal.
Clona projetos usados na equipe da Home UOL. (www.uol.com.br, editorial, jsuol, TC, tclink)
Execute sudo npm install -g em /git/git-deploy, em /robocopier/ e em /tclink/

#### Para LSHome, TC e nginx ####
Para criar o link simbólico de "www.uol.com.br-editorial", basta ir para "git/www.uol.com.br/" e executar  "tclink"  no terminal.
Para rodar a TC na home, execute tcl.

Execute "bash nginx.sh" no terminal.
Verifique os hosts digitando "hosts" no terminal e utilize "ngstr" para iniciar o serviço.  

** EXECUTAR SOMENTE EM CASO DE ERRO **
No projeto da Home UOL podem aparecer erros ao executar "npm install" ou "npm start" em "camaleao/src/", execute "git config --global http.sslverify "false"". O repositório pode estar com conflitos de https e este comando libera para download.