OBS.1: `SY-SUBRC = 0` é o código que garante que os comandos tiveram sucesso!
OBS.2: Na dúvida, sempre DEBUGAR pra entender o que realmente está acontecendo.
OBS.3: `Função 'lines( <t_nomeTabela> )` me trás quantas linhas tem aquela tabela.
OBS.4: `SY-ULINE` imprime uma linha comprida na impressão.



### ====== TABELA INTERNA STANDART ======

- Tabela interna é uma variável;
- O mais comum vai ser sempre ela conter uma estrutura com mais de uma linha!;
- Se eu der 2 cliques na estrutura, ela vai ser aberta e detalhada pra mim;
- Posso declarar apenas `TYPE TABLE OF` também, pq por default, já vai ser a STANDART.

<br>

- #### CRIANDO E ADICIONANDO LINHAS À TABELA INTERNA

> `DATA <t_nomeTabelaI> TYPE STANDART TABLE OF <estruturaDicionario>.` - Crio a tabela

> `DATA <s_nomeEstrutura> TYPE <estruturaDicionario>.` - Cria uma linha que tem exatamente os mesmos campos que a estrutura da Tabela

<br>

- #### CARREGAR DADOS DE OUTRAS TABELAS:

> `SELECT *`

> `....INTO TABLE <t_nomeTabela>`

> `....FROM <tabelaOrigem>.`

OBS.: Pega todos os dados daquela tabela padrão para dentro da minha interna

<br>

- #### ADICIONANDO VALORES AOS CAMPOS DA ESTRUTURA E MANDANDO PRA TABELA INTERNA

> `<s_nomeEstrutura>-<campo1> = <valor1>.` - Adiciono valores em cada campo (~ coluna)

> `<s_nomeEstrutura>-<campo2> = <valor2>.` - //  //  //

> `APPEND <s_nomeEstrutura> TO <t_nomeTabela>.` - Envio essas adições que eu fiz pra linha seguinte disponível da tabela interna

OBS.1: Só adicionar os valores não funciona. Preciso adicionar os valores e enviar pra tabela com o APPEND depois.

OBS.2: Cada linha daquela tabela do dicionário que eu mencionei, é uma estrutura com vários campos, quando eu crio uma linha nova, essa linha vai ter a mesma quantidade de campos para ser preenchido. Enão, quando eu adionar valores, preciso adicionar dos campos todos que já criei lá.

OBS.3: Se eu clicar duas vezes no nome da estrutura lá dentro do DEBUG, ele vai me mostrar como tá ficando aquele preenchimento.

<br>

- #### LIMPANDO TABELA INTERNA TODA:

> `CLEAR <t_nomeTabela>.`

- #### MODIFICANDO DADOS POR ÍNDICE (o ROW):

> `<s_nomeEstrutura>-<campo1> = <novoValor1>.`

> `<s_nomeEstrutura>-<campo2> = <novoValor2>.`

> `MODIFY <t_nomeTabela> FROM <s_nomeEstrutura> INDEX <num>.`

OBS.: Não necessariamente precisa trocar todos os valores, mas eu não tive como testar agora se eu preciso repetir mesmo os dados que eu não vou mudar ou se posso colocar só as alterações.

OBS.2: Os índices, no ABAP, sempre começam por 1 mesmo.

- #### REMOVENDO DADOS POR ÍNDICE (o ROW):

> `DELETE <t_nomeTabela> INDEX <num>.`

- #### REMOVENDO DADOS POR FILTRO:

> `DELETE <t_nomeTabela> WHERE <campo1> = <valor1>.`

- #### LENDO UMA LINHA POR ÍNDICE:

> `CLEAR <s_nomeEstrutura>.`

> `READ TABLE <t_nomeTabela> INTO <s_nomeEstrutura> INDEX <num>.`

OBS.1: Primeiro eu limpo a estrutura que vai receber aqueles dados, pra garantir que o que vai vir, é realmente o certo e não "restos" de outra operação ou que na verdade, seja um índice vazio.

OBS.2: Pra garantir que a linha daquele índice está realmente preenchida, eu posso analisar o `SY-SUBRC = 0`.

- #### LENDO UMA LINHA POR FILTRO:

> `CLEAR <s_estrutura>.`
> `READ TABLE <t_nomeTabela> INTO <s_nomeEstrutura> WITH KEY <campo1> = <valor1>.`

<br>

- #### LENDO E IMPRIMINDO VÁRIAS LINHAS DE UMA TABELA INTERNA:

> `LOOP AT <t_nomeTabela> INTO <s_nomeEstrutura>.`

> `....WRITE <s_nomeEstrutura>-<campo1>,` - Uma lógica que eu queria (se for necessário, por ex...)

> `..........<s_nomeEstrutura>-<campo2>.`

> `....NEW-LINE.` - Só um ex mesmo

> `ENDLOOP.`

OBS.1: Ele vai passar na quantidade de linhas que ele tiver e vai jogar em algum lugar (na estrutura que eu dei).

OBS.2: Com esse exemplo específico acima usando `WRITE`, já vale como a forma de imprimir na tela os dados daquela tabela.

<br>

- #### MODIFICANDO UMA LINHA EM LOOP:

> `LOOP AT <t_nomeTabela> INTO <s_nomeEstrutura>.`

> `....<s_nomeEstrutura>-<campo1> = |{ <s_nomeEstrutura>-<campo1> }<adição>|.` - Nesse caso, ele só queria concatenar valores mesmo, mas eu podia mudar algo total

> `....MODIFY <t_nomeTabela> FROM <s_nomeEstrutura>.`

> `ENDLOOP.`

OBS.: Eu posso usar `IF` *dentro* do `LOOP` pra que a mudança só ocorra, caso aquela condição seja verdade. EX.:

> `....IF <s_nomeEstrutura>-<campo1> = <valor1>.`

> `........<o código do que eu quero alterar + a linha MODIFY como acima>.`

> `....ENDIF`

- #### `SORT` - COMANDO DE ORDENAÇÃO:

> `SORT <t_nomeTabela> BY <campo1> DESCENDING.` - Ordena descrescente

> `SORT <t_nomeTabela> BY <campo1> DESCENDING <campo2 ASCENDING.` - Ordenando descrescente e crescente

OBS.1: Da forma que eu ordenar aquela lista **ANTES DO LOOP** é o que vai fazer já ser impresso assim também, já que é a ordem que ele vai ler.

OBS.2: Eu posso usar mais de um critério junto, sem perder a ordenaçao anterior (em ordem de nome, em 1º lugar, e com ordem de id, em 2º, tbm, por ex.. Maria 3 | Maria 6)

- #### REMOVENDO LINHAS DUPLICADAS:

> `SORT <t_nomeTabela> BY <campo1> ASCENDING.`

> `DELETE ADJACENT DUPLICATES FROM <t_nomeTabela> COMPARING <campo1>.` - Vai deletar o 2º que for igual DAQUELE CAMPO, mesmo que o resto seja diferente.

> Ele seguiu com o `LOOP` para impressão da lista.

- #### DEBUG:

> `<t_nomeTabela>[<num>]` no campo de variáveis, vai me mostrar os campos daquele INDEX

> Caso tenha colocado um INDEX que não exista, vai aparecer um raiozinho

> Se coloco `[]` vazias, ele considera a tabela toda

> Eu posso MODIFICAR o valor de um campo de uma linha pelo DEBUG. É só clicar 2x no nome da tabela, 2x no campo e clicar no "lápis".

> Posso ADICIONAR também pelo DEBUG. Igual acima, mas clico com o botão direito no quadrado do campo vazio > "Change table content" > "Append Roll". Ele copia a linha 1, mas é só eu ir alterar como queira.

> DELETAR também é possível, com os passos acima, mudando só o final pra operação que eu desejo.

<br>