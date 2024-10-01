> OBS.: O que está entre < ... > é campo de adição de valor, que pode ser diferente do que está de exemplo!

### ====== TRANSAÇÕES ======

- `SE38` - Para manipular programas (abre o editor ABAP/4)
- `SE93` - Para criar transações customizadas
- `SE11` - Dicionário. Para criar domínios, elementos e tabelas (visualização da arquitetura de uma tabela/estrutura do SAP)
- `SE16N` - Exibe a tabela rápido e simples
- `SE16` - Visualização do conteúdo de tabelas do SAP
- `/H` - Ativa o debug
* 1. `SE01` - Principal. Verifica o conteúdo das ordens gerais
* 2. `SE09` - Simplificada. Verifica ordens de objetos Client Idependent (Workbench Organizer)
* 3. `SE10` - Gerenciador de requests (Consigo consultar as tabelas que criei (?))
- `/O<SE38>` - Abre a transação selecionada numa nova janela
- `/N<SE38>` - Abre a transação selecionada no lugar daquela mesma janela

* `SE43` - Criação de menus
* `SE71` - Criação e manutenção de formulários SAPscripts
* `CMOD` - Criação de projetos Exits (Field Exits, User Exits,...)
<br>
<br>

### ====== CRIANDO UM PROGRAMA ======

1. SE38 `>` 'ZnomePrograma'
2. add um título `>` Programa Executável `>` Cliente Produtivo
3. add o `Package` 'ZACADEMIA_OUT_24'     *{Na academia}*
4. add a `ordem`, que já tá indo automático aqui 'SXTK900070' *{Na academia}*
- ASSIM, eu vou ter criado um PROGRAMA EXECUTÁVEL (= REPORTs)

Obs.: Meu programa (todos os objetos do workbench) precisa sempre ser associado a **um pacote** e uma **ordem de transporte**.
<br>
<br>

### ====== CRIANDO TRANSAÇÕES ======

1. SE93 `>` 'ZnomeTransação'
2. add o texto breve descrição `>` Programa e tela de seleção (Transação de report), por ser um programa executável
3. Programa: RFITEMGL (usei isso na primeira) (?)
4. Marco a mais apenas opções em Capacidade GUI: `HTML`, `JAVA` E `WINDOWS`

Obs.: Eu posso colocar programas que eu criei para rodarem dentro dessa transação. Por ex., eu ter criado uma calculadora e colocar ela pra rodar quando a determinada transação "tal" foi chamada.
<br>
<br>

### ====== WRITE ======

Comando para impressões na tela.

> `WRITE v_variavelGlobal.`

> `WRITE: p_vari01, p_vari02.`

> `WRITE: '<texto>, /, p_variav.`

> `WRITE: /'<texto>.` (Será ?)

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
- `STRING` - Strings de tamanhos variáveis
- `X` - Valores binários ou hexadecimais (transferências de dados de baixo nível)
- `QUAN` - Quantidades físicas (pode ter decimais tbm) (?)
- `CLNT` - Representa o cliente
- `datum` - Data do servidor
- `uzeit` - Hora do servidor
- `datlo` - Data do meu servidor
- `timlo` - Hora do meu servidor
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
<br>

### ====== DECLARAR VARIÁVEL ======

Declaração dos espaços de memória para guardar informações.

> `DATA v_variavelGlobal(<20>) TYPE <C>.`

> `DATA: v_variavelGlobal<10> TYPE <I>, l_variavelLocal<20> TYPE <C>.`

> `DATA v_variavel LIKE CHAR<10>.`

> `DATA v_variavelGlobal TYPE <C> LENGTH <30>.`

> `DATA l_variavelLocal VALUE '<1>'.`

- Se a variável estiver vazia e o tipo dela for INTEIRO, vai ser impresso '0' (não tem 'not null' aqui);
- `v_variavel` OU `l_variavel`: A variável pode ser global ou local, respectivamente;
- Posso usar tanto `TYPE` quanto `LIKE` para definir a tipagem da variável.
<br>
<br>

### ====== CRIAR PARAMETERS ======

As telas de seleção dos usuários. "O imput".

> `PARAMETERS p_variav TYPE <tipo> OBLIGATORY(se precisar).`

> `PARAMETERS: p_vari01 TYPE <CHAR10>, p_vari02 TYPE <CHAR30>`

> `PARAMETERS p_variav(<15>) TYPE <C> DEFAULT '<texto>'.` : Mostra uma caixa com preenchimento automático que o usuário não adiciona.

1. Depois de criar `>` Elementos de texto `>` Textos de Seleção
2. Lá eu consigo alterar a frase que vai aparecer para o usuário no momento em que for receber essa tela de seleção
3. **Não esquecer** de ***SALVAR*** e ***ATIVAR*** nessa etapa também, pra poder voltar pro executável pra ativá-lo também.

É uma boa prática sempre iniciar os nomes de variáveis provindas de parameters com `p_......` e daí, sobram apenas mais 6 dígitos para seu nome

<br>

> RADIOBUTTON:

Criação de botões clicáveis.

`PARAMETERS: p_vari01 RADIOBUTTON GROUP <g1>, p_vari02 RADIOBUTTON GROUP <g1>.`
<br>
<br>

### ====== SPLIT E CONCATENATE ======

<br>
<br>

### ====== INCLUDES ======

É um pedaço de programa que não tem em tela;
Um programa, mas que não é executável, por isso que quando eu uso no código, preciso clicar duas vezes para criar realmente esse objeto, mas lá eu só vou me preocupar com o título;

> No programa: 

`REPORT ZnomePrograma.`

`INCLUDE: ZnomePrograma_TOP,`

`.........ZnomePrograma_SEL.`

`START-OF-SELECTION.`

`END-OF-SELECTION.`
<br>
<br>

### ====== IF ======

*IF <condição>.
* <ação>.
*ENDIF.

* == OU ==

*IF <condição>.
*  <ação>.
*ELSEIF <condição>.
* <ação>.
*ELSE.
* <ação>.
*ENDIF.

* == OU ==

*IF <condição>.
* <ação>.
*ELSE.
* <ação>.
*ENDIF.
*
* Com RADIOBUTTON, eu uso assim: IF p_variav 'X' (é a forma que ele vai entender que aquela opção é que está selecionada.
<br>
<br>

### ====== CASE ======

*CASE 'X'.
*  WHEN <opção1>.
*    <ação>.
*  WHEN <opção2>.
*    <ação>.
*  WHEN OTHERS.
*    <ação>.
*  ENDCASE.
<br>
<br>

### ====== DEIXAR EM BLOCOS ======

*SELECTION-SCREEN BEGIN OF BLOCK <b1> WITH FRAME TITLE text-001.
*  PARAMETERS ... .
*SELECTION-SCREEN END OF BLOCK <b1>.
*
*SELECTION-SCREEN BEGIN OF BLOCK <b2> WITH FRAME TITLE text-002.
*  PARAMETERS ... .
*SELECTION-SCREEN END OF BLOCK <b2>.
*
*ETC
*
* Após criá-los, eu clico 2x nos "text" pra criar o título de cada bloco.
* Elementos de texto > Símbolos de texto
* No geral, ele pode tá lá no INCLUDES, por trazer nos blocos as telas de seleção que quero que o usuário tenha.
<br>
<br>

### ====== EVENTOS DO REPORT ======

1. INITIALIZATION
2. AT-SELECTION-SCREEN
3. START-OF-SELECTION  (uso sempre antes de começar o código, abaixo dos INCLUDES)
4. END-OF-SELECTION  (uso sempre pra encerrar o código)
5. TOP-OF-PAGE  (já em desuso, quase) {Não vamos usar na Academia}
6. AT-LINE-SELECTION  (já em desuso, quase) {Não vamos usar na Academia}
<br>
<br>

### ====== OBS GERAIS ======

* Nomes de desenvolvimentos customizados (fora do padrão SAP) sempre ***iniciam com "Z..." ou "Y..."***
- SEMPRE terminar toda ação no código com `.`
* `<>`: Diferente
* `=`: Igual
- `F1` em cima do comando - SAP Help, ajuda técnica ou documentação daquele comando
- `F4` no campo de entrada - Search Help, lista de valores possíveis para aquele campo específico
<br>

> Comentários:
- `*` OU `"`: Comenta o código, no início ou no meio dele, respectivamente
- `ctrl + <` OU `ctrl + >`: Comenta e descomenta um trecho todo de código

<br>

