## Projeto Start for Linux (Cinnamon) baseado nas configs necessárias para o ambiente UOL.
  Antes de setar as configs, baixar os seguintes aplicativos auxiliares

      ##### Para ambiente dev
            sudo apt install terminator
            sudo apt install snapd
            sudo snap install snapcraft --classic 
            sudo snap install code --classic 
            sudo snap install node --channel=8/stable --classic
            sudo yum install nginx

            Instalar dentro de $HOME/start/
            - (CURL) sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
            - (WGET) sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
      ##### Para entretenimento    
            sudo snap install spotify
            sudo snap install musixmatch
      ##### Para comunicação
            sudo snap install slack --classic
            sudo snap install skype --classic
      ##### Para design
            sudo snap install gimp
      ##### Pessoal
            rambox  
            sftpclient
            wordpress-desktop
            github-desktop --edge

Após instalar os aplicativos, execute no terminator bash start.sh
O arquivo start.sh procura os dotfiles dentro do projeto e executa as configurações de cada.

########################################################################

### PARA AMBIENTE UOL ###
Execute bash uol.sh para clonar determinados projetos usados na equipe da Home UOL. (www.uol.com.br, editorial, jsuol, TC, tclink)

Execute sudo npm install -g em /git/git-deploy, em /robocopier/ e em /tclink/

  #### Para criar links simbólicos LS #### 
  Em /templatecache-local/templates/ crie links simbólicos para seu ambiente local, baseados nos seus projetos dentro de /git/
  Ex.: sudo ln -s $HOME/start/git/www.uol.com.br/ $HOME/start/templatecache-local/templates/home.uol.com.br

  No caso de home uol editorial, ir para /git/www.uol.com.br/ e executar  tclink  no terminator. Isso cria um link simbólico de /git/www.uol.com.br-camaleao-editorial/ dentro de /camaleao/.
  
  Quando for rodar a Template Cache Local http e https da homeuol, execute ./run.sh 58080 58081

  #### Para nginx ####
  Os dominios e servers usados estão dentro de /app/nginx/.
  Em .main, após executarmos start.sh, são setados os paths do nginx. 
  
  Quando for rodar o nginx, verifique os hosts setados em /etc/hosts.conf, execute sudo service nginx start/status/restart/stop para avaliar o estado do nginx em qualquer path.  
  
No projeto da Home UOL pode acontecer de dar erro ao executar npm install ou start em /camaleao/src/, executar git config --global http.sslverify "false". O repositório pode estar com conflitos de https e este comando libera para download. Executar somente se houver erro.

Pronto, seu ambiente para desenvolvimento UOL já está configurado. 