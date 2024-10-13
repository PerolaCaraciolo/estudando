### ====== COMANDOS DE REPETIÇÃO ======

- `EXIT` é um comando para encerrar qualquer um dos LOOPs, que SAI DELE COMPLETO (mas geralmente não preciso usar, a não ser em algum IF específico do caso que seja necessário)

EX.: LOOP `>` IF <isso> `>` EXIT `>` ENDIF `>` WRITE <aquilo> `>` ENDLOOP `=` Se entrar no IF, não vai imprimir nem fazer mais nada a partir dali! Segue o programa que tem fora desse LOOP.

<br>

- `CONTINUE` interrompe AQUELE LAÇO ESPECÍFICO (tbm vai ser mais usual se dentro de um IF com a condição). 

EX.: LOOP `>` IF <isso> `>` CONTINUE `>` ENDIF `>` WRITE <aquilo> `>` ENDLOOP `=` Se entrar no IF, não vai imprimir nada e segue pra análise do próximo. Se não entrar no IF, imprimi e segue pro próximo

- `LOOP INFINITO`: Tem como deixar uma condição sempre verdadeira no "WHILE" ou sem qtd de vezes no "DO", mas **sempre** vou precisar colocar uma condição de parada com `EXIT`! (mas tem que ser uma causa muito específica e necessária, tipo processos assíncronos, como NF, pq pode processar demais)


#### LOOP AT

- `SY-TABIX` - Trás cada linha que eu passo (pedir pra imprimir ela, me mostra que linha eu tô. 'sy-index' aqui não serve);
- Repete um bloco de código na qtd de linhas que aquela tabela tiver;
- Posso ter um LOOP dentro de OUTRO;
- "LER uma linha TAL e JOGAR na estrutura TAL";
- Segue a ideia de que posso ir imprimindo os campos;
- Eu posso colocar condições como filtro dentro do LOOP com `WHERE` + condicionais tipo > < <> = AND OR (uma ou mais);
- Trabalha com tabelas internas e estruturas (por isso posso usar filtro e o WHILE não).

> `LOOP AT <t_nomeTabelaI> INTO <s_nomeEstrutura> WHERE <campo1> '>' <valor> AND <campo2> '=' <valor2>.` - Caso eu queira usar condições pra afunilar as opções, por ex

> `....WRITE: 'sy-tabix', SY-TABIX.` - Caso eu queira imprimir o tabix

> `....WRITE: <s_nomeEstrutura>-<campo1>, <s_nomeEstrutura>-<campo2>.` - Pra imprimir os dados dela

> `....NEW-LINE.` - Quebrar linha pra mostrar o loop da próx linha da tabela

> `ENDLOOP.`

#### WHILE

- `SY-INDEX` - a cada laço, ela vai aumentando 1 (pra saber quantas vezes já deu o laço. 'sy-tabix' aqui não serve);
- Também repete um trecho de código dentro dele;
- A condição precisa retornar um BOOLEAN. Se TRUE, entra, se FALSE, sai;
- Não consigo fazer filtros porque ele trabalha com uma condição!

> `WHILE 'sy-index <= lines( <t_nomeTabelaI> ).` - Um ex de condição

> `....WRITE: 'sy-index', SY-INDEX.` - Caso eu queira imprimir o index

> `....READ TABLE <t_nomeTabelaI> INTO <s_nomeEstrutura> INDEX sy-index.`

> `....WRITE: <s_nomeEstrutura>-<campo1>, <s_nomeEstrutura>-<campo2>.`

> `....NEW-LINE.`

> `ENDWHILE.`

#### DO

- `SY-INDEX` aumenta a cada vez que ele passa ali (tabix n serve aqui tbm);
- Sempre preciso informar quantas vezes preciso repetir;
- Posso usar um DO puro, sem a quantidade de vezes. Isso vai ser um DO infitino.


> `DO <num> TIMES.`

> `....WRITE: 'sy-index', SY-INDEX.`

> `....READ TABLE <t_nomeTabelaI> INTO <s_nomeEstrutura> INDEX sy-index.` - Ler uma linha de tabela

> `WRITE: <s_nomeEstrutura>-<campo1>, <s_nomeEstrutura>-<campo2>.`

<br>

### ====== CRIANDO TYPES ======

- TYPE SIMPLES:

> `TYPES <y_nomeType> TYPE <tipo>.` - Criando o TYPE

> `DATA <v_nomeVariável> TYPE <y_nomeType>.` - Criando uma variável pra usar aquele type

OBS.: É como ter a ideia de guardar em uma variável pq na hora de alterar, só mudo em um canto e ele já troca  restante automático.

- TYPE PARA ESTRUTURA:

> `TYPES <y_nomeType> TYPE <estruturaDicionário>.`

> `DATA <s_nomeEstrutura> TYPE <y_nomeType>.`

- TYPE PARA TABELA INTERNA:

> `TYPES <ty_nomeTypeTabela> TYPE STANDART TABLE OF <estruturaDicionário>.` - Criando uma estrutura de tabela interna

> `DATA <t_nomeTabelaI> TYPE <ty_nomeTypeTabela>.` - Criando a variável usando esse tipo

**OU**

> `DATA <t_nomeTabelaI> TYPE STANDART TABLE OF <estruturaDicionário>.` - Caso eu não tivesse criado com o 'TYPES'

- TYPE PARA ESTRUTURAS CUSTOMIZADAS (qdo não quero todos os campos dela):

> `TYPES: BEGIN OF <y_nomeType>,`

> `.......<campo> TYPE <tipo>,` - Coloco então os campos que quero que esse type tenha!

> `.......<campo> TYPE <nomeTabela>-<campo>,` - Desse jeito, eu posso mencionar já um campo da tabela, que ele vai trazer o tipo dela

> `.......END OF <y_nomeType>.`

> `DATA <s_nomeEstrutura> TYPE <y_nomeType>.` - Criando uma estrutura desse Type

- TYPE DE OUTRO TYPE:

Criando um segundo tipo que usa o primeiro.

> `TYPE <y_nomeType> TYPE <estruturaDicionário>.`

> `TYPE <ty_nomeTypeTabela> TYPE STANDART TABLE OF <y_nomeType>.`

> `DATA <s_nomeEstrutura> TYPE <y_nomeType>.` - Criando as variáveis

> `DATA <t_nomeTabelaI> TYPE <ty_nomeTypeTabela>.`

- INCLUINDO CAMPOS NA ESTRUTURA:

> `TYPES: BEGIN OF <y_nomeType>,`

> `.......<campo> TYPE <tipo>.` - Campo a mais que quero adicionar

> `.......INCLUDE TYPE <estruturaDicionário>.` - Trás todos os campos que ela já tem

> `TYPES: END OF <y_nomeType>.`

> `DATA <s_nomeEstrutura> TYPE <y_nomeType>.` - Criando uma variável pra criar o tipo que acabei de criar

- TIPO COM ESTRUTURA E TABELA INTERNA:

> `TYPES <ty_nomeTypeTabela> TYPE <estruturaDicionário> WITH NON-UNIQUE KEY <campo>.` - Criei aqui pq usei ela ali em baixo

> `TYPES: BEGIN OF <y_nomeType>,`

> `.......<campo> TYPE <tipo>,` - Colocando um campo simples

> `.......<campoMesmoNomedoType> TYPE <estruturaDicionário>,` - Colocando um campo que tenha a estrutura da <estruturaDicionário>

> `.......<t_nomeTabelaI> TYPE <ty_nomeTypeTabela>,` - Colocando um campo que é uma tabela interna (aí eu tenho que criar ela ali em cima)

> `.......END OF <y_nomeType>.`

> `DATA: <s_nomeEstrutura> TYPE <y_nomeType>.` - Criando variável pra usar esse type

OBS.: Se eu usar uma tabela interna dentro de um tipo de tabela interna, vai dar erro! Por isso, quando eu crio ela ali em cima, eu adiciono os comandos "WITH..."