### ====== COMANDOS PARA GIT ======

* `git init`  //  Inicia a linha do tempo
* `git init -b main`    //  Já cria na main, e não na master
* `git add <' .' ou nome do arquivo>`   //  Adiciona ou atualiza mudanças para irem para a linha do tempo (pra main ou outra branch)
* `git commit -m "<msg do commit>"` //    Adiciona um ponto na linha do tempo
* `git commit -am "<msg do commit"`    //  Já faz o "git add" e o "git commit" ao mesmo tempo!
* `git log`   //  Visualiza os pontos na linha do tempo / commit
* `git status`    //  Informa o estado das alterações do nosso projeto
* `git show <código do commit ou nada>`  //  Apresenta determinado ponto na história ou o último
* `git branch <nome nova branch>` //  Gerenciar novas linhas do tempo. {Cria uma ramificação, uma nova linha do tempo}
* `git branch -D <nome da branch que desejo excluir`  //  Exclui a branch mencionada
* `git checkout <nome da branch desejada>`    //  Manipula as linhas do tempo {Muda a linha do tempo que eu tô usando para a que mencionei, seja uma outra branch ou mesmo qualquer commit anterior que eu já tenha feito}
* `git checkout -b <nome da nova branch desejada>` //  Cria uma branch na hora e já muda pra ela ao mesmo tempo
* `git merge <nome da branch que quero juntar>`   //  Unir linhas do tempo {Vai trazer as adições da branch mencionada para a que eu estiver trabalhando no momento}
* `git remote add origin <link do repositório no GitHub>` //  Conecta meu projeto do VsCode a um repositório do GitHub
* `git remote -v` //  Vejo meus repositórios remotos
* `git push -u origin main`   //  Envia alterações locais para o repositório remoto {EMPURRA o meu projeto do pc para o GitHub {MAS só precisa colocar esse '-u origin main' pra criar na main uma vez. qdo for só add a coisas depois, pode BOTAR SÓ O `git push` mesmo!}}
* `git config credential.helper store`    //  Pra não precisar ficar colocando o email e senha toda vez que formos subir um "push" pro GitHub
* `git clone <link do repositório do GitHub que eu quero>`    //  Clonar um projeto / repositório {Puxa um repositório do GitHub pro meu pc}
* `git pull`  //  Puxa do repositório remoto {Ele vai conferir (PUXAR) aquele meu repositório do pc com o do GitHub, atualizando ele, pra ver se está tudo certo.}



### ====== GITHUB ======

> PARA SUBIR UM PROJETO DO PC PRO HUB
1. PRIMEIRO crio o repositório no GitHub
2. `git init`
3. `git add .`
4. `git commit -m "<msg do commit>"` NO TERMINAL DO PROJETO NO VS CODE
5. `git remote add origin <link do repositório do GitHub>`
6. `git branch -M "main"`   Mas aí vai ser se eu tiver criado na master e preferir que seja a main
7. `git push -u origin main <ou master>`
8. Ele vai pedir usuário e senha
. PRONTINHOOO...
. Depois que fez isso a primeira vez, só vai assim mais simples ooh...
9. `git add .`
10. `git commit -m "<msg do commit>"`
11. `git push`    {PARA MANDAR ATUALIZAÇÕES DO QUE JÁ FOI EMPURRADO A PRIMEIRA VEZ}


> PARA BAIXAR UM PROJETO DO HUB PRO PC
1. `git clone <link do repositório>` eu trago o repositório pra minha máquina
2. `git pull` vai fazer eu sempre poder conferir se talvez não tem nada novo no meu remoto pra atualizar o meu local.



### ====== EXTRAS ======

- `>simple`   //  No campo de pesquisa lá de cima, ele abre uma página de navegador aqui no próprio VS pra mim :O

- Eu posso colocar uma msg de commit com mais de uma obs, separadas por ";"

- Se aconteceu um conflito na hora do `merge`, pq a mesma linha foi alterada nas duas ramificações, no vs vai me mostrar onde está esse conflito e me fazer escolher com quais das opções eu vou querer. E DAÍÍÍ, eu vou fazer o `add` e o `commit` de novo. Pq, por causa do conflito, não rolou.

- O IDEAL É EU SEMPRE dar um `git pull` antes de dar o `git push`, pra evitar de dar conflitos. Pq eu igualo o meu pc com qualquer alteração que tenha tido lá na nuvem nessa hora que puxo. E só daí, então, eu empurro meu projeto do pc pra nuvem com tudo certinho.

- PARA VOLTAR PRA UM COMMIT anterior qualquer, primeiro eu mando o `git log` pra poder ver o detalhamento dos commits que já fiz, daí identifico qual que eu quero (se eu quero que volte pra o ponto do commit X, eu vou olhar pro código do commit do que foi depois) e copio o código do commit seguinte e uso no `git checkout <código do commit> -- <nome do commit (o que eu dou, que tá lá como "update") do anterior ao do que usei o código (que vai ser o que eu quero que volte a ser)>` (considerar os espaços mesmo), e aí aquela etapa que eu queria, volta. ISSO SERVE PRA RECUPERAR ALGO DELETADO TAMBÉM.
- SEEE eu quiser usar aquela anterior recuperada mesmo, eu vou ter que fazer o commit de novo, não esquecer.
