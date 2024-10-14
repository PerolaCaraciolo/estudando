### ====== JOINs ======

- Operação feita no banco de dados que une 2 tabelas em uma 3ª, que só existe enquanto o comando SELECT está sendo executado;
- Eu posso usar quantos JOINs eu quiser dentro do SELECT;
- Geralmente, ligo as duas tabelas **por campos em comum**, com mesmo tipo e valor;
- `INNER JOIN` (ou só JOIN) E `LEFT JOIN` são os principais.
- Eu preciso identificar (LÁ NA SE16N), quais colunas são em comum entre as duas tabelas pra poder ligar elas;

- #### INNER

- Se ele não encontrar nas duas tabelas, ele **NÃO** trás a linha que não tem nas duas! Ex. se o aeroporto aparece em uma lista e n na outra, ele não vem.

> O prof costumou declarar **um grande TYPES** pra BEGIN OF de cada tabela (1 - pra tabela principal, 2 - pra tabela secundária, 3 - pro resultado das duas COLOCANDO AS REPETIDAS UMA VEZ SÓ!). >> gera uma **TABELA INTERNA** dessa `TYPE RESULTADO` >> uma `WORKAREA` (estrutura s_) do tipo do `TYPE RESULTADO` tbm >> cria o filtro desejado com o `SELECT-OPTIONS` >> `START-OF-SELECTION` >> 

> `SELECT <alias~campo1>`

> `.......<alias~campo2>`

> `....FROM <estruturaDicionário1> AS <aliasPrinc>` - Trago qual é minha tabela principal e seu alias

> `....INNER JOIN <estruturaDicionário2> AS <aliasSec>` - Trago a tabela segundária e seu alias

> `....ON <aliasPrinc>~<campo1> = <aliasSec>~<campo2>` - O campo que é igual na principal e na secundária pra relacionar (é OBRIGATÓRIO ter um ON desse pra CADA JOIN que eu fizer nesse SELECT)

> `....INTO TABLE <t_nomeTabelaI>` - A tabela interna que eu gerei do resultado

> `....WHERE <aliasPrinc>~<campo1> IN <s_campoSelect>.` - "Onde tiver o campo da principal no range do SELECT-OPTION...

> <condição que eu queira>

> `IF SY-SUBRC = 0.` - Nunca esquecer de conferir

> `ENDIF.`

- No vídeo:

> Ele fez um TYPEzão do resultado das duas tabelas >> criou a tabela interna com TYPE do TYPEzão do resultado >> START-OF-SELECTION >> Botou os selects dentro de um FORM sendo chamado pelo PERFORM >>

> `SELECT <alias>~<campo> ...`

> `....FROM <estruturaDicionário1> AS <aliasPrinc>`

> `....JOIN <estruturaDicionário2> AS <aliasSec> ON <aliasSec>~<campo2> = <aliasPrinc>~<campo1>`

> `....INTO CORRESPONDING FIELDS OF TABLE <t_campoTabelaI>.`

<br>

- #### LEFT

- Se ele não encontrar nas duas tabelas, ele **TRÁS** a linha que não tem nas duas! Ex. se o aeroporto aparece em uma lista e n na outra, ele vem também. Mesmo que deixe determinado campo vazio!!

> Do mesmo jeitinho, só que com `LEFT JOIN` (o prof já usou LEFT outer JOIN, mas n lembro pq)

- Vídeo:

> `SELECT <alias>~<campo> ...`

> `....FROM <estruturaDicionário1>`

> `....LEFT JOIN <estruturaDicionário2> ON <estruturaDicionário2>~<campo2> = <estruturaDicionário1>~<campo1>`

> `....INTO CORRESPONDING FIELDS OF TABLE <t_campoTabelaI>.`

<br>

### ====== FOR ALL ENTRIES ======

- Um recurso do SELECT tipo de JOIN, entre uma tabela de banco com uma tabela interna (se tiver 2 de banco, já não dá, diferente do JOIN, o que torna mais pesado e maçante), MAAS não tem como usar colunas da tabela interna na saída do SELECT;
- Só uso se o JOIN não for possível, ou se parte da informação estiver fora do banco, dentro de uma tabela interna;

- EU: "Consulto uma tabela do banco com o SELECT, e jogar pra uma TABELA INTERNA (posso reduzir o que vai ser mandado pra dentro com um WHERE) `>>` Faço outra consulta em outra tabela de banco e ligo ela àquela interna que eu criei antes MAS SÓ LIGO, com a comparação `>>` Daí uso o FOR ALL ENTRIES na TABELA INTERNA do TYPEzão RESULTADO que eu crio lá no início com os campos das duas tabelas dos bancos que me interessam, dizendo quais (WHERE) colunas vão se ligar entre ESSES CAMPOS com os que têm LÁ NO TYPEzão"

- EU: "Como eu não consigo adicionar valores pra campos que não estão em comum nas duas pelo FOR ALL ENTRIES, depois dele eu tenho que fazer um LOOP que passe linha a linha dessa tabela >> Dou a condição pra procurar aquele dado que tá vazio onde é possível de achar ele com o SY-SUBRC pra então conseguir adicionar o valor àquela tabela."


> `SELECT <campo> ...`

> `....INTO TABLE <t_nomeTabelaI1>`

> `....FROM <estruturaDicionário1>`

> `..WHERE <condição que eu precise>.`

<br>

> `SELECT <campo> ...`

> `....FROM <estruturaDicionário2>`

> `....INTO CORRESPONDING FIELDS OF TABLE <t_nomeTabelaITypezão>.`

> `....FOR ALL ENTRIES IN <t_nomeTabelaI1>`

> `..WHERE <estruturaDicionário2>-<campo1> = <t_nomeTabelaI1>-<campo2>.`

<br>

> `LOOP AT <t_nomeTabelaITypezão> ASSIGNING <<s_fieldSymbolTypezão>>.`

> `....READ TABLE <t_nomeTabelaI1> INTO <s_nomeEstrutura> WITH TABLE KEY <campo2> = <<s_fieldSymbolTypezão>>-<campo1>.`

> `....IF SY-SUBRC = 0.`

> `........<<s_fieldSymbolTypezão>>-<campoFaltando> = <s_nomeEstrutura>-<campoFaltando>.`

> `....ENDIF.`

> `ENDLOOP.`

OBS.: As variáveis tudinho, foram declaradas no topo lá no vídeo.

OBS.2: **SEMPRE** colocar o `FOR ALL ENTRIES` **dentro de um IF** que valide que aquela tabela interna realmente recebeu algum dado, se não vai trazer o fullzão da tabela de banco de dados inteiro! Vai acabar dando DUMP no programa, a depender de quantos campos tenham. Boto *logo depois do primeiro Select* e *antes do select que tem o FOR ALL ENTRIES*, pq vou colocar ele dentro:

> `IF lines( <t_nomeTabelaI1> ) > 0.`

<br>

OBS.: Lembrar que tem o `BINARY SEARCH` também, e que precisa adicionar o `SORT` antes pra usar ele! ;D