### ====== COMANDOS OPEN SQL ======

- Comandos DML;
- Se eu usar o conjunto de comandos Open SQL, o próprio SAP pega eles e traduz pro banco nativo e executa ele lá. E vice-versa. Então dá pra usar qualquer banco de dados sem me preocupar com os comandos específicos de cada um;
- Desse jeito, mesmo que eu mude o banco nativo, não terá problemas;
- Eu armazeno as informações que preciso em Bancos de Dados;


- #### SELECT

Vai no banco de dados, pega a informação e trás pra camada de aplicação;

> `DATA: <t_nomeTabelaI> TYPE STANDART TABLE OF <estruturaDicionário>.` - Criando a tabela interna pra usar ali dentro do Select

> `DATA: <s_nomeEstrutura> TYPE <estruturaDicionário>.` - Crio aqui uma estrutura pra poder usar no LOOP lá em baixo

<br>

> `SELECT <campo1> <campo2> <campo3> <etc>` - Seleciono os campos que vou pegar ou `*` para pegar todos

> `....INTO TABLE <t_nomeTabelaI>` - Pra onde esses dados vão (mas aí vou ter que criar ela ali em cima)

> `....FROM <estruturaDicionário>` - Qual a tabela eu quero buscar os dados

Fazendo um LOOP pra escrever os nomes na tela:

> `LOOP AT <t_nomeTabelaI> INTO <s_nomeEstrutura>.` - Preciso criar uma estrutura (lá em cima tbm) pra receber cada linha do LOOP

> `....WRITE <s_nomeEstrutura>-<campo>.`

> `....WRITE <s_nomeEstrutura>-<campo2>.`

> `....NEW-LINE.`

> `ENDLOOP.`


- #### INSERT

Insere UMA linha lá na tabela de banco de dados. Eu preciso primeiro preencher os dados numa estrutura. E o IDEAL é sempre limpar ela primeiro pra não acabar tendo algum conflito.

> `CLEAR <s_nomeEstrutura>.` - Limpar a estrutura que vai receber os dados

> `<s_nomeEstrutura>-<campo1> = <valor1>.` - Adicionando os valores da nova linha na estrutura

> `<s_nomeEstrutura>-<campo2> = <valor2>.`

> `INSERT <estruturaDicionário> FROM <s_nomeEstrutura>.` - A tabela que vai receber as informações **E** a estrutura que têm os dados

OBS.: Eu coloco esse trecho todo aqui **entre** as declarações DATA **e** as do SELECT e do LOOP do trecho anterior.

OBS.2: Ele só adiciona UM POR VEZ, e tem que ser por uma estrutura (**workarea**)

OBS.3: Se o campo não for obrigatório naquela estrutura, não preciso preencher na hora do INSERT também (o MANDANTE não precia inserir pq já vai automático).

OBS.4: Eu sei que conseguiu inserir mesmo, que deu certo, **conferindo o SY-SUBRC** logo após a instrução INSERT.


- #### UPDATE

Atualiza uma ou mais linhas no banco de dados da tabela.

> `CLEAR <s_nomeEstrutura>.` - Limpar a estrutura sempre antes de começar a preencher pra garantir que não tenha nada nela

> `<s_nomeEstrutura>-<campo1> = <valor1>.` - Eu tenho que passar também esse meu CAMPO CHAVE (sem ser o mandante)! Pra poder ele identificar qual linha vai mudar

> `<s_nomeEstrutura>-<campo2> = <valor4>.` - Campo que eu quero atualizar

"E"

> `MODIFY <estruturaDicionário> FROM <s_nomeEstrutura>.` - A tabela que quero modificar **E** a estrutura que têm os dados

"OU"

> `UPDATE <estruturaDicionário>` - Qual tabela (linha de tabela, né) eu quero atualizar

> `....SET <campo2> = <s_nomeEstrutura>-<campo2>` - O campo que eu quero atualizar (se tiverem mais campos para alterar, só colocar em baixo sem a vírgula mesmo)

> `....WHERE <campo1> = <s_nomeEstrutura>-<campo1>.` - O campo chave!

OBS.: Eu coloco esse trecho todo aqui **entre** as declarações DATA **e** as do SELECT e do LOOP do trecho anterior.

OBS.2: `MODIFY` altera as informações mas também pode acabar adicionando, caso não tenha (acaba funcionando como INSERT tbm). JÁ O `UPDATE`, apenas atualiza o conteúdo do que já existe.

OBS.3: Como dá pra ver acima, com o `MODIFY` eu posso passar esse comando já com a estrutura, já no `UPDATE`, eu vou botando campo a campo junto com ele.



- #### DELETE

Deleta uma ou mais linhas de uma tabela lá no banco de dados.

> `DELETE FROM <estruturaDicionário> WHERE <campo1> = <valor1>.` - Deletar através do CAMPO CHAVE

OBS.: Eu coloco esse trecho todo aqui **entre** as declarações DATA **e** as do SELECT e do LOOP do trecho anterior.

OBS.2: **Não esquecer** do `WHERE`, se não ele vai deletar a tabela inteira.

OBS.3: Não precisa limpar mais a estrutura, porque não preciso mexer nela pra deletar. "Já vou direto pra tabela original".