OBS.: Eu consigo analisar melhor o meu DUMP baixando ele, clicando no código onde ele localiza e até procurar a nota da classe do erro. Mas precisa de login no SAP NOTES pra poder ter a respostona lá.


### ====== SELECT-OPTIONS ======

> `DATA <v_campo> TYPE <campo>.` - Tenho que criar uma variável do campo pra usar em baixo o mesmo tipo.

> `SELECT-OPTIONS <s_campoSelect> FOR <v_campo>.` - O campo que eu vou querer gerar o RANGE. E tenho que declarar uma variável lá em cima pra definir o tipo que quero, sn não vai aceitar!

**OU** (Professor VV)

> `TABLES: <estruturaDicionário>.` - As tabela que quero analisar no SELECT-OPTIONS vêm aqui. entra aqui a tabela cabeçalho (??)

> `SELECT-OPTIONS: <s_campoSelect> FOR <estruturaDicionário>-<campo>.` - Defino qual vai ser o campo analisado em RANGE

> <...>

- O S.O. um `RANGE` na tela de seleção!
- Uma variável (uma tabela interna) de `RANGE`;
- Eu consigo ter várias linhas de "ranges" diferentes;
- COLUNAS: `SIGN` - `I` se quero incluir | `E` se quero excluir
- ........ `OPTIONS` - `> < <> >= <= =` ...
- ........ `LOW` e `HIGH` - Se eu for botar um valor ou dois

OBS.: Posso botar o SELECT-OPTIONS dentro de um bloco de "SELECTION-SCREEN BEGIN OF BLOCK" ou não. (???)

OBS.2: Posso monitorar o tipo de `OPTIONS` e valores nos filtros avançados da tela de seleção aparecendo já, naquela "orelinha" ao lado das caixinhas de valores.

> <...>

> `START-OF-SELECTION.`

> `DATA <t_nomeTabelaI> TYPE STANDART TABLE OF <estruturaDicionário>.` - Criando a tabela interna por causa do INTO TABLE (caso já não esteja criada, inclusive com a junção das duas tabelas, como nos do professor)

> `SELECT <campo1>` - Quero esses campos...

> `.......<campo2>`

> `.......<campo3>`

> `....FROM <estruturaDicionário>` - Vou puxar os dados dessa tabela aqui

> `....INTO TABLE <t_nomeTabelaI>` - Vou jogar os dados pra essa tabela aqui | A tabela interna da estruturaDicionário que já vou criar aqui lá em cima

> `..WHERE <campo1> IN <s_campoSelect>` - Aplicando meu filtro range do select aqui, nesse campo1  (como é um RANGE no SELECT, uso "IN")

OBS.: Se eu tiver mais de um filtro, no caso, MAIS DE UM PARÂMETRO DE RANGE, eu vou colocar eles **no mesmo WHERE** com `AND` ou `OR` (dependendo do que eu preciso).

OBS.2: Eu posso trazer condições de IF tbm pra fazer análises de valores nos campos.