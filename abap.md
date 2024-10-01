> OBS.: O que está entre < ... > é campo de adição de valor, que pode ser diferente do que está de exemplo!

> OBS.2: Lembrar de sempre fazer uma observação básica e direta pras pessoas saberem o que são minhas variáveis e afins!

### ====== TRANSAÇÕES ======

- `SE38` - Para manipular programas (abre o editor ABAP/4)
- `SE93` - Para criar transações customizadas
- `SE11` - Dicionário. Para criar domínios, elementos e tabelas (visualização da arquitetura de uma tabela/estrutura do SAP)
- `SE16N` - Exibe a tabela rápido e simples
- `SE16` - Visualização do conteúdo de tabelas do SAP
- `/H` - Ativa o debug
* 1. `SE01` - Principal. Verifica o conteúdo das ordens gerais
* 2. `SE09` - Simplificada. Verifica ordens de objetos Client Idependent (Workbench Organizer)
* 3. `SE10` - Gerenciador de requests (Consigo consultar as tabelas que criei) (??)
- `/O<SE38>` - Abre a transação selecionada numa nova janela
- `/N<SE38>` - Abre a transação selecionada no lugar daquela mesma janela

* `SE43` - Criação de menus
* `SE71` - Criação e manutenção de formulários SAPscripts
* `CMOD` - Criação de projetos Exits (Field Exits, User Exits,...)

<br>

### ====== CRIANDO UM PROGRAMA ======

1. SE38 `>` 'ZnomePrograma'
2. add um título `>` Programa Executável `>` Cliente Produtivo (pq coloquei executável)
3. add o `Package` 'ZACADEMIA_OUT_24'     *{Na academia}*
4. add a `ordem`, que já tá indo automático aqui 'SXTK900070' *{Na academia}*
- ASSIM, eu vou ter criado um PROGRAMA EXECUTÁVEL (= REPORTs; = REQUESTs) (??)

<br>

Obs.: Meu programa (todos os objetos do workbench) precisa sempre ser associado a **um pacote** e uma **ordem de transporte**.

<br>

### ====== CRIANDO TRANSAÇÕES ======

1. SE93 `>` 'ZnomeTransação'
2. add o texto breve descrição `>` Programa e tela de seleção (Transação de report), por ser um programa executável
3. Programa: RFITEMGL (usei isso na primeira) (?)
4. Marco a mais apenas opções em Capacidade GUI: `HTML`, `JAVA` E `WINDOWS`

<br>

Obs.: Eu posso colocar programas que eu criei para rodarem dentro dessa transação. Por ex., eu ter criado uma calculadora e colocar ela pra rodar quando a determinada transação "tal" foi chamada.

<br>

### ====== WRITE ======

Comando para impressões na tela e em variáveis, já adequando a escrita pra linguagem definida.

> `WRITE v_variavelGlobal.`

> `WRITE: p_vari01, p_vari02.`

> `WRITE: '<texto>, /, p_variav.`

> `WRITE: /'<texto>.` OU `WRITE: / '<texto>', v_variavelGlobal.` (Será ?)

> `WRITE /.` OU `SKIP <num linhas>.` : Quebra uma linha OU mais de uma

> `WRITE UNLINE.` : Imprime "uma linha" de hífens no código

<br>

### ====== TYPES ======

<br>

> TIPOS DE DADOS:
- `CHAR10` / `CHAR<30>` / `C LENGTH <30>` - Strings de tamanho fixo
- `CURR` - Valores monetários ($$)
- `I` - Números inteiros
- `F` - Float (maior precisão decimal)
- `N` `LENGTH <8>.` - String numérico (números não calculados)
- `D` - Datas YYYYMMDD
- `T` - Horas HHMMSS
- `P` `DECIMALS <3>.` - Número com <> casas decimais
- `BUKRS` - Código de empresa (um CHAR4 com suas características)
- `STRING` - Strings de tamanhos variáveis
- `X` - Valores binários ou hexadecimais (transferências de dados de baixo nível)
- `QUAN` - Quantidades físicas (pode ter decimais tbm) (?)
- `CLNT` - Representa o cliente
- `TIMESTAMP` - Data e hora do momento que rodou YYYYMMDDHHMMSS
- datum - Data do servidor
- uzeit - Hora do servidor
- datlo - Data do meu servidor
- timlo - Hora do meu servidor
- DATS E TIMS - Usados mais pra tabelas (??)

<br>

> VARIÁVEIS DE SISTEMA
- `SY-DATUM` - Data atual do sistema YYYYMMDD
- `SY-UZEIT` - Hora atual do sistema HHMMSS
- `SY-DATLO` - Data da última alteração YYYYMMDD
- `SY-TIMLO` - Hora da última alteração HHMMSS
- `SY-UNAME` - Nome do usuário que está executando
- `sy-langu` - Idioma do usuário logado
- `sy-ucomm` - Um comando do usuário. Bom pra interação com botões
- `sy-pagno` - Número da página atual
- `sy-tcode` - Código da transação atual
- `sy-repid` - Nome do programa (report ou função) executado

<br>

### ====== DECLARAR VARIÁVEL ======

Declaração dos espaços de memória para guardar informações.

> `DATA v_variavelGlobal(<20>) TYPE <C>.`

> `DATA: v_variavelGlobal<10> TYPE <I>, l_variavelLocal<20> TYPE <C>.`

> `DATA v_variavel LIKE CHAR<10>.`

> `DATA v_variavelGlobal TYPE <C> LENGTH <30>.`

> `DATA l_variavelLocal TYPE I VALUE '<1>'.` : Declarando já com valor

- Se a variável estiver vazia e o tipo dela for INTEIRO, vai ser impresso '0' (não tem 'not null' aqui);
- Para declarar valores depois, coloco apos o *evento INITIALIZATION* (caso eu tenha usado ele): `v_variavelGloval = 12.` / `l_variavelLocal = 1.`;
- Posso declarar desse mesmo jeito acima, lá dentro do *INCLUDES* tbm;
- `v_variavel` OU `l_variavel`: A variável pode ser global ou local, respectivamente;
- Posso usar tanto `TYPE` quanto `LIKE` para definir a tipagem da variável.

<br>

### ====== CRIAR PARAMETERS ======

As telas de seleção dos usuários e, sempre, estarão logo em cima. "O imput".

> `PARAMETERS p_variav TYPE <tipo> OBLIGATORY(se precisar).`

> `PARAMETERS: p_vari01 TYPE <CHAR10>, p_vari02 TYPE <CHAR30>.`

> `PARAMETERS p_variav(<15>) TYPE <C> DEFAULT '<texto>'.` : Mostra uma caixa com preenchimento automático que o usuário não adiciona.

1. Depois de criar `>` Elementos de texto `>` Textos de Seleção;
2. Lá eu seleciono a variável que desejo e consigo alterar a frase que vai aparecer para o usuário no momento em que for receber essa tela de seleção;
3. **Não esquecer** de ***SALVAR*** e ***ATIVAR*** nessa etapa também, pra poder voltar pro executável pra ativá-lo também.

- É uma boa prática sempre iniciar os nomes de variáveis provindas de parameters com `p_......` e daí, sobram apenas mais 6 dígitos para seu nome.

<br>

OBS.: Variáveis de tela de seleção NÃO PODEM ser criadas antes ou fora do PARAMETERS.

<br>

> RADIOBUTTON:

Criação de botões clicáveis.

`PARAMETERS: p_vari01 RADIOBUTTON GROUP <g1>, p_vari02 RADIOBUTTON GROUP <g1>.`

<br>

### ====== INCLUDES ======

É um pedaço de programa que não tem em tela.<br>
Um programa, mas que não é executável, por isso que quando eu uso no código, preciso clicar duas vezes nele para criar realmente esse objeto, mas nesta outra tela, eu só vou me preocupar com o título.<br>
Vem logo abaixo do `REPORT ZnomePrograma.`

- `ZnomePrograma_TOP.`, eu arrasto todas as variáveis declaradas (DATA) que vou utilizar, pra cá.
- `ZnomePrograma_SEL.`, eu arrasto todas as telas de seleção (PARAMETERS) que vou utilizar, pra cá.

<br>

> No programa: 

1. `REPORT ZnomePrograma.`
2. `INCLUDE: ZnomePrograma_TOP,`
3. `.........ZnomePrograma_SEL.`
4. `START-OF-SELECTION.`
5. `END-OF-SELECTION.`

<br>

OBS.: Dá pra usar o INCLUDE de outra pessoa.

<br>

### ====== SPLIT E CONCATENATE ======


<br>

### ====== EVENTOS DO REPORT ======

Não são necessariamente obrigatórios, mas são ideais.

1. `INITIALIZATION.`: 

- O 'quick start' da transação, precisa acontecer antes das telas de seleção serem apresentadas;
- Só vem depois das telas de seleção e das declarações de variáveis (só depois do INCLUDE);
- Uso **para inicializar as variáveis** e definir valores tbm.

2. `AT-SELECTION-SCREEN`: 

- Pós tela de seleção exibida e antes da lógica de processamento principal;
- Posso validar aqui logo **se o usuário adicionou um dado válido ou não**!
- Me possibilita também de criar as orelhinhas de pesquisa dos campos de inserção. (??)

3. **`START-OF-SELECTION`**:

- Pós os INCLUDES;
- Uso sempre antes de começar o código, a lógica principal do programa. "O core do meu processamento" fica aqui dentro;
- Quando o ABAP começa a executar a lógica, processar os dados e gerar as saídas.

4. **`END-OF-SELECTION`**:

- Uso sempre pra encerrar o código principal;
- Posso emitir msgs de finalização com ele, inclusive;
- Ex.: `END-OF-SELECTION.` + `WRITE: /'Fim da execução do programa.'.`

5. `TOP-OF-PAGE`:

- Usado para criar cabeçalhos fixos pros inícios das páginas de saída da transação;
- Já em desuso, quase. *{Não vamos usar na Academia}*

6. `AT-LINE-SELECTION`:

- Para relatórios;
- Comando gerado quando o usuário clica em uma linha específica da saída. Posso adicionar alguma lógica para acontecer por causa desse clique;
- Já em desuso, quase. *{Não vamos usar na Academia}*

<br>

OBS.: Quando o programa pode demorar demais, o ideal é que eu já coloque o "`1`" e guarde uma `v_hora = SY-UZEIT`, ou `TIMESTAMP` pra ter também a hora que aquilo começou. Lembrando que se uso o "`1`", tenho que usar o "`3`" e "`4`"!

<br>

### ====== IF ======

1. `IF <condição>.`
2. `...<ação>.`
3. `ENDIF.`

<br>

> ou

<br>

1. `IF <condição>.`
2. `....<ação>.`
3. `ELSEIF <condição>.`
4. `....<ação>.`
5. `ELSE.`
6. `....<ação>.`
7. `ENDIF.`

<br>

> ou

<br>

1. `IF <condição>.`
2. `....<ação>.`
3. `ELSE.`
4. `....<ação>.`
5. `ENDIF.`

<br>

* ***Com RADIOBUTTON***, eu uso assim: `IF p_variav 'X'.` (é a forma que ele vai entender que aquela opção é que está selecionada.

<br>

OBS.: Ter ATENÇÃO com **divisões por 0!!** Eu preciso tratar com IF essa condição, senão eu quebro o sistema.

<br>

### ====== CASE ======

1. `CASE '<X>'.`
2. `...WHEN <opção1>.`
3. `.......<ação>.`
4. `...WHEN <opção2>.`
5. `.......<ação>.`
6. `...WHEN OTHERS.`
7. `.......<ação>.`
8. `ENDCASE.`

<br>

OBS.: Se eu estiver tratando também de resposta pra ***RADIOBUTTON***, também trato com "`X`".

<br>

### ====== DEIXAR EM BLOCOS ======

1. `SELECTION-SCREEN BEGIN OF BLOCK <b1> WITH FRAME TITLE text-<001>.`
2. `.........PARAMETERS: p_vari01 TYPE <tipo>, p_vari02 TYPE <tipo>.`
3. `SELECTION-SCREEN END OF BLOCK <b1>.`

Bloco 1 ^^^^

4. `SELECTION-SCREEN BEGIN OF BLOCK <b2> WITH FRAME TITLE text-<002>.`
5. `.........PARAMETERS: p_vari03 TYPE <tipo>, p_vari04 TYPE <tipo>.`
6. `SELECTION-SCREEN END OF BLOCK <b2>.`

Bloco 2 ^^^^

<br>

- Após criá-los, eu clico 2x nos "`text`" pra criar o objeto e ele direcionar direto para...
- Elementos de texto `>` Símbolos de texto;
- Esse textinho que eu altero lá, vai ser justamente o **título de cada bloco**;
- **Se eu erro esse textinho**, preciso excluir o que foi criado antes e fazer de novo só ese processo;
- Posso separar em **quantos blocos mais eu quiser**. Ex.: "*Operadores*" e "*Operações*".

<br>

OBS.: No geral, **essa estrutura de blocos vai estar lá no INCLUDES**, pelos blocos delimitarem justamente as telas de seleção que quero que o usuário receba.

<br>

### ====== DEBUG ======

- `/H` + `F8` `>` Desktop 3 `>` Coluna da direita, toco no espaço da variável e add "`SY`" `>` Enter `>` 2 cliques no "SY", me abre **todas as variáveis do sistema**.
- `F5` vai fazendo a linha de código executada debugada "andar".

<br>

*Desktop 1*: Mostra poucas linhas<br>
*Desktop 2*: Mostra tipo uma "cascata", de quem chamou quem, que chamou quem, que...<br>
*Desktop 3*: Mostra programas e variáveis

<br>

### ====== OBS. GERAIS ======

- ABAP é **procedural**: faz a leitura de cima pra baixo;
* Nomes de desenvolvimentos customizados (fora do padrão SAP) sempre ***iniciam com "Z..." ou "Y..."***;
- **SEMPRE** terminar toda ação no código com `.`;
* O SAP / ABAP **não é case sensitive**, mas não aceita caracteres;
- Especificações do usuário `>` Dados usuário `>` Valores fixos; : Encontro / altero **minhas preferências de formatação do sistema**;
* O `compilador` sempre vai apontar o erro (caso haja) na linha exata ou na anterior;
- Para considerar que o **RADIOBUTTON** está selecionado, sempre vou considerar `'X'` maiúsculo mesmo.

<br>

> TimeStamp:
- Não é uma Variável do Sistema e sim um Tipo!
- Eu posso guardá-la em uma variável utilizando o datum e o uzeit, por exemplo.

Declarando:

 1. `Data v_timestamp TYPE TIMESTAMP.`

 2. `v_timestamp = SY-DATUM && SY-UZEIT.`

 3. `WRITE v_timestamp.`
 
 OU

 1. `Data v_timestamp TYPE TIMESTAMP.`

 2. `v_timestamp = SY-DATUM && SY-UZEIT.`

 3. `DATA: l_data TYPE D, l_hora TYPE T.`.

 4. `l_data = v_timestamp(8)` : Só os primeiros 8 caraceres da data
 
 5. `l_hora = v_timestamp+8(6)` : Próximos 6 caracteres da hora

<br>

> Atalhos:
- `F1` em cima do comando - SAP Help, ajuda técnica ou documentação daquele comando
- `F4` no campo de entrada - Search Help, lista de valores possíveis para aquele campo específico
- `Ctrl + S` : Salva
- `Ctrl + F2` : Compila (confere)
- `Ctrl + F3` : Ativa
- `F3` : Volta (??)
- `F8` : Executa

<br>

> Operadores:
- `<>`: Diferente
- `=`: Igual

<br>

> Comentários:
- `*` OU `"`: Comenta o código, no início ou no meio dele, respectivamente
- `ctrl + <` OU `ctrl + >`: Comenta e descomenta um trecho todo de código

<br>
