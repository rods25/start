## TODO Config domains nginx
## Projeto Start (Cinnamon) com as configs necessárias para o ambiente dev.

Copie e cole o código abaixo em um editor e faça as alterações necessárias. Depois execute no terminal.

### Instalando packs para dev
```sh
#
#!/usr/bin/env bash

echo "Iniciando instalação dos pacotes"
PACKS=( 
    "git"
    "terminator" 
    "snapd" 
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
    "1password"
    "chromium"
    "strimio-desktop"
)
for SNAPS in "${SNAPPACKS[@]}"
do
    snap install $SNAPS
done

#
# Instalando ZSH e NVM

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#
# Gerando Key SSH para o stash se necessario
#ssh-keygen -t rsa -C "rodrigo.rifesa@gmail.com"
#xclip -selection clipboard < ~/.ssh/id_rsa.pub
#echo "xclip ssh to stash, favor colar no seu ambiente"

#
# Após configurar o SSH Key no stash, clone o projeto START para /home/rrsantos/Documentos/space/
# cd /home/rrsantos/Documentos/space/
git clone https://github.com/rods25/start ~/Documentos/space/start

```
### Instalações do sistema ###
Acessar o path onde ficará os seus projetos, execute "cat > initDownloads.sh", cole o código acima e saia do processo com ctrl + C.
Executar "bash initDownloads.sh" e acompanhar os processos. Após finalizar, continue seguindo os passos abaixo. 

### Para ambiente de dev ###
Executar "bash start.sh" no terminal.
O arquivo "start" possui configurações que auxiliam no desenvolvimento. 

Execute "bash nginx.sh" no terminal.
Verifique os hosts digitando "hosts" no terminal e utilize "ngstr" para iniciar o serviço.  