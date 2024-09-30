> OBS.: O que está entre < ... > é campo de adição de valor, que pode ser diferente do que está de exemplo!

### ====== CRIANDO UM PROGRAMA ======

1. SE38 > 'ZnomePrograma'
2. add um título > Programa Executável > Cliente Produtivo
3. add o Package 'ZACADEMIA_OUT_24'     *{Na academia}*
4. add a ordem, que já tá indo automático aqui 'SXTK900070' {Na academia}
- ASSIM, eu vou ter criado um programa EXECUTÁVEL (= REPORTs)
<br>
Obs.: Meu programa (todos os objetos do workbench) precisa sempre ser associado a **um pacote** e uma **ordem de transporte**.
<br>
<br>

### ====== CRIANDO TRANSAÇÕES ======

1. SE93 > 'ZnomeTransação'
2. add o texto breve descrição > Programa e tela de seleção (Transação de report, por ser um programa executável)
3. Programa: RFITEMGL (usei isso na primeira (?) )
4. Marco a mais apenas opções em Capacidade GUI: HTML, JAVA E WINDOWS
<br>
<br>

### ====== TYPES ======

* CHAR10 / CHAR<30> / c LENGTH <30> - strings
* i - números
* d - data
* p DECIMALS <3> - Número com casas decimais
* datum - Data do servidor
* uzeit - Hora do servidor
* datlo - Data do meu servidor
* timlo - Hora do meu servidor
* sydatum
* syuzeit
<br>
<br>

### ====== TRANSAÇÕES ======

* SE38 - Para programas
* SE93 - Para criar transações
* SE11 - Dicionário. Para criar tabelas
* SE01 - principal / SE09 - simplificada / SE10 - Gerenciador de requests (Consigo consultar as tabelas que criei (?))
* SE16N - Exibe a tabela rápido e simples
* /H - Ativa o debug
* /O<se38> - Abre a transação numa nova janela
* /N<se38> - Abre a transação no lugar daquela mesma janela
> Com apostila vazada:
- SE38 - abre o editor ABAP/4
- SE16 - permite a visualização do conteúdo de tabelas do SAP 
- SE11 - permite a visualização da arquitetura de uma tabela/estrutura do SAP
- SE43 - criação de menus
- SE93 - criação de transações customizadas
- SE71 - criação e manutenção de formulários SAPscripts
- CMOD - criação de projetos Exits (Field Exits, User Exits,...)
<br>
<br>

### ====== SPLIT E CONCATENATE ======

<br>
<br>

### ====== INCLUDES ======

É um pedaço de programa que não tem em tela;
Um programa, mas que não é executável, por isso que quando eu uso no código, preciso clicar duas vezes para criar realmente esse objeto, mas lá eu só vou me preocupar com o título;

> No programa: 

> `REPORT ZnomePrograma.`
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
*
* == OU ==
*
*IF <condição>.
*  <ação>.
*ELSEIF <condição>.
* <ação>.
*ELSE.
* <ação>.
*ENDIF.
*
* == OU ==
*
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

* 1 - INITIALIZATION
* 2 - AT-SELECTION-SCREEN
* 3 - START-OF-SELECTION  (uso sempre antes de começar o código, abaixo dos INCLUDES)
* 4 - END-OF-SELECTION  (uso sempre pra encerrar o código)
* 5 - TOP-OF-PAGE  (já em desuso, quase) {Não vamos usar na Academia}
* 6 - AT-LINE-SELECTION  (já em desuso, quase) {Não vamos usar na Academia}
<br>
<br>

### ====== DECLARAR VARIÁVEL ======

> `DATA v_variavelGlobal(<20>) TYPE <c>.`

> `DATA: v_variavelGlobal<10> TYPE <i>,`
`......l_variavelLocal<20> TYPE <c>.`

> `DATA v_variavel TYPE char<10>.`

> `DATA v_variavelGlobal TYPE <c> LENGTH <30>`

- Se a variável estiver vazia e o tipo dela for INTEIRO, vai ser impresso '0' (não tem 'not null' aqui);
- `v_variavel` OU `l_variavel`: A variável pode ser global ou local, respectivamente;
<br>
<br>

### ====== PARAMETERS ======


<br>
<br>

### ====== OBS GERAIS ======

- Nomes de desenvolvimentos customizados (fora do padrão SAP) sempre ***iniciam com "Z" ou "Y"***;
- `<>`: Diferente
- `=`: Igual
<br>

> Comentários:
- `*` OU `"`: Comenta o código, no início ou no meio dele, respectivamente
- `ctrl + <` OU `ctrl + >`: Comenta e descomenta um trecho todo de código


* SEMPRE terminar toda ação com PONTO FINAL
* SEMPREEEE salvar, conferir (compilar), ativar pra, então, verificar
* F1 em cima do comando  - 

* 'TYPE' ou 'LIKE'  -  Definem a tipagem



* 'WRITE /.' OU 'SKIP <num linhas>.'  -  Pula linha
* 'WRITE: 'texto', '/', p_variav.'  -  Imprime mais de uma coisa ao mesmo tempo


* 'PARAMETERS p_variav TYPE <tipo> <OBLIGATORY (se precisar)>.'  -  Como criar uma tela de seleção
* 'PARAMETERS p_variav RADIOBUTTON GROUP <g1>.'  -  Cria um botão clicável
* Depois de criar > 'Elementos de texto' > 'Textos de seleção',
* eu consigo alterar a frase que vai aparecer para o usuário no momento em que for receber essa variável.
* Não esquecer de salvar e ativar lá também!






OK * 'v_variavel' OU 'l_variavel'  -  Variável global OU variável global
OK * 'DATA v_variavel TYPE tipo.'  -  Cria variável
OK * Se a variável tiver vazia e for inteiro, ela imprime '0' (não tem 'not null')