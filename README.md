## TODO Config domains nginx
## Projeto Start (Cinnamon) com as configs necessárias para o ambiente UOL.

Copie e cole o código abaixo em um editor e faça as alterações necessárias. Depois execute no terminal.

### Instalando packs para dev
```sh
#
#!/usr/bin/env bash

echo "Iniciando instalação dos pacotes"
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
    apt-get install $APPS
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
    snap install $SNAPS
done

#
# Instalando ZSH e NVM

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

#
# Gerando Key SSH para o stash uol
ssh-keygen -t rsa -C "rrfsantos@uolinc.com"
#xclip -selection clipboard < ~/.ssh/id_rsa.pub
#echo "xclip ssh to stash, favor colar no seu ambiente"

#
# Após configurar o SSH Key no stash, clone o projeto START para /home/rrfsantos/Documents/space/
# cd /home/rrfsantos/Documents/space/
git clone ssh://git@stash.uol.intranet:7999/~rrfsantos/start.git start

```
### Instalações do sistema ###
Acessar o path onde ficará os seus projetos, execute "cat > initDownloads.sh", cole o código acima e saia do processo com ctrl + C.
Executar "bash initDownloads.sh" e acompanhar os processos. Após finalizar, continue seguindo os passos abaixo. 

### Para ambiente de dev ###
Executar "bash start.sh" no terminal.
O arquivo "start" possui configurações que auxiliam no desenvolvimento. 

### Para ambiente UOL ###
Execute "bash uol.sh" no terminal.
Clona projetos usados na equipe da Home UOL. (www.uol.com.br, editorial, jsuol, TC, tclink)
*Execute npm install -g em /git/git-deploy, em /robocopier/ e em /tclink/*

#### Para LSHome, TC e nginx ####
Para criar o link simbólico de "www.uol.com.br-editorial", basta ir para "git/www.uol.com.br/" e executar  "tclink"  no terminal.
Para rodar a TC na home, execute tcl.

Execute "bash nginx.sh" no terminal.
Verifique os hosts digitando "hosts" no terminal e utilize "ngstr" para iniciar o serviço.  

** EXECUTAR SOMENTE EM CASO DE ERRO **
No projeto da Home UOL podem aparecer erros ao executar "npm install" ou "npm start" em "camaleao/src/", execute "git config --global http.sslverify "false"". O repositório pode estar com conflitos de https e este comando libera para download.