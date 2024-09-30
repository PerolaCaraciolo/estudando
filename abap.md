### ====== CRIANDO UM PROGRAMA ======

1. SE38 > 'ZnomePrograma'
2. add um título > Programa Executável > Cliente Produtivo
3. add o Package 'ZACADEMIA_OUT_24'     {Na academia}
4. add a ordem, que já tá indo automático aqui 'SXTK900070' {Na academia}
- ASSIM, eu vou ter criad um programa EXECUTÁVEL <br>
Obs.: Meu programa precisa sempre ser associado a um pacote e uma ordem de transporte.
<br>
<br>

### ====== CRIANDO TRANSAÇÕES ======

1. SE93 > 'ZnomeTransação'
2. add o texto breve descrição > Programa e tela de seleção (Transação de report, por ser um programa executável)
3. Programa: RFITEMGL (usei isso na primeira (?) )
4. Marco a mais apenas em Capacidade GUI: HTML, JAVA E WINDOWS
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
* >> TRANSAÇÕES:
*
* SE38 - Para programas
* SE93 - Para criar transações
* SE11 - Dicionário. Para criar tabelas
* SE01 / SE09 / SE10 - Gerenciador de requests (Consigo consultar as tabelas que criei (?))
* SE16N - Exibe a tabela rápido e simples
* /h - Ativa o debug
* /o<se38> - Abre a transação numa nova janela
* /n<se38> - Abre a transação no lugar daquela mesma janela
<br>
<br>

### ====== SPLIT E CONCATENATE ======

<br>
<br>

### ====== INCLUDES ======
* >> INCLUDE:

* Um programa, mas que não é executável, por isso eu precisso clicar duas vezes para criar realmente esse objeto, quando uso no código, mas lá eu só vou me preocupar com o título
* <no programa >>>
* '
* REPORT ZnomePrograma.
* INCLUDE: ZnomePrograma_TOP,
*           ZnomePrograma_SEL.
* START-OF-SELECTION.
* END-OF-SELECTION.
*'
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

### ====== OBS GERAIS ======

* SEMPRE terminar toda ação com PONTO FINAL
* SEMPREEEE salvar, conferir (compilar), ativar pra, então, verificar
* F1 em cima do comando  ->
* '*' no início ou '"' no meio do código  ->  Abre comentários
* 'ctrl + <' E 'ctrl + >'  ->  Comenta e descomenta um trecho todo de código
* 'TYPE' ou 'LIKE'  ->  Definem a tipagem

* <>  ->  Diferente
* =  ->  Igual

* 'WRITE /.' OU 'SKIP <num linhas>.'  ->  Pula linha
* 'WRITE: 'texto', '/', p_variav.'  ->  Imprime mais de uma coisa ao mesmo tempo

* 'PARAMETERS p_variav TYPE <tipo> <OBLIGATORY (se precisar)>.'  ->  Como criar uma tela de seleção
* 'PARAMETERS p_variav RADIOBUTTON GROUP <g1>.'  ->  Cria um botão clicável
* Depois de criar > 'Elementos de texto' > 'Textos de seleção',
* eu consigo alterar a frase que vai aparecer para o usuário no momento em que for receber essa variável.
* Não esquecer de salvar e ativar lá também!

* 'v_variavel' OU 'l_variavel'  ->  Variável global OU variável global
* 'DATA v_variavel TYPE tipo.'  ->  Cria variável
* Se a variável tiver vazia e for inteiro, ela imprime '0' (não tem 'not null')