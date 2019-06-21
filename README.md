## Projeto Start (Cinnamon) com as configs necessárias para o ambiente UOL.
Executar "bash start.sh" no terminal.
O arquivo "start" configura e instala programas necessários para o desenvolvimento. 

### PARA AMBIENTE UOL ###
Execute "bash uol.sh" no terminal.
Clona projetos usados na equipe da Home UOL. (www.uol.com.br, editorial, jsuol, TC, tclink)
Execute sudo npm install -g em /git/git-deploy, em /robocopier/ e em /tclink/

#### Para LSHome, TC e Nginx ####
Para criar o link simbólico de "www.uol.com.br-editorial", basta ir para "git/www.uol.com.br/" e executar  "tclink"  no terminal.
Para rodar a TC na home, execute tcl.

Execute "bash nginx.sh" no terminal.
Verifique os hosts digitando "hosts" no terminal e utilize "ngstr" para iniciar o serviço.  

** EXECUTAR SOMENTE EM CASO DE ERRO **
No projeto da Home UOL podem aparecer erros ao executar "npm install" ou "npm start" em "camaleao/src/", execute "git config --global http.sslverify "false"". O repositório pode estar com conflitos de https e este comando libera para download.