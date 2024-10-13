### ====== EVENTOS DO REPORT ======

- `AT SELECTION-SCREEN OUPUT.`: Antes de aparecer a tela de seleção, passa aqui (PBO - Process before output);

- `AT SELECTION-SCREEN ON <campo>.`: Só acontece quando ocorre dentro daquele campo específico;

- `AT SELECTION-SCREEN ON END OF <campoSelOpt>.`: No final da seleção desse campo;

- `AT SELECTION-SCREEN ON HELP-REQUEST FOR <campo>.`: O que aparece quando aperto "F1" naquele campo;

- `AT SELECTION-SCREEN ON VALUE-REQUEST FOR <campo>.`: O que acontece quando aperto "F4" naquele campo;

- `AT SELECTION-SCREEN ON BLOCK <bloco>.`: Quando passar naquele bloco;

- `AT SELECTION-SCREEN ON RADIOBUTTON GROUP <radiobuttonGroup>.`: Quando passar naquele grupo.




### ====== VARIÁVEIS LOCAIS E GLOBAIS E FORMS ======

- DENTRO DO CÓDIGO:

> `START-OF-SELECTION.`

> `....PERFORM <nomePerform>`

> `........USING <var1> <var2> <parm1> <var3>`

> `........CHANGING <var4>.`

> `....PERFORM <outroPerform>.`

- O FORM é como se fosse uma função pra outras linguagens (VISÃO MINHA, VIU!), que faz você criar ela num INCLUDE e apenas chamar com PERFORM dentro do código, com ou sem parâmetros;
- Aribuir parâmetros sempre vai ser o ideal pra deixar o mais organizado possível;
- `USING` eu uso pras variáveis que vão funcionar de forma "cte" ali dentro do meu FORM;
- `CHANGING` eu uso para mudar ou atribuir valores àquelas variáveis (atribuo valor a uma global com o funcionamento de outras momentaneamente locais).

- DENTRO DO FORM:

> `FORM <nomePerform>`

> `.    USING <u_nomeLocal1> <u_nomeLocal2> <u_nomeLocal3>`

> `.    CHANGING <c_nomeLocal4>.`

> `.    DATA <l_nomeLocal> TYPE <tipo>.`

> `.    *Código do programa*`

> `.    <c_nomeLocal4> = <l_nomeLocal>.`

> `ENDFORM`

- Dentro dele, eu preciso atribuir nomes pras que serão utilizadas lá dentro, com `U_` para as do USING e `C_` para as do CHANGING;
- Quando for pra atribuir o valor gerado dentro, pra que é de fora, eu PRIMEIRO declaro a de fora e igualo a de dentro.




### ====== ESTRUTURAS LOCAIS ======

- Só são usadas dentro do programa criado.

- DECLARAÇÃO DE ESTRUTURAS:

> `DATA: BEGIN OF <s_nomeEstrutura>,`

> `.    <campo1> TYPE <tipo>,`

> `.    <campo2> TYPE <tipo>,`

> `.    <campo3> TYPE <tipo>,`

> `.    END OF <s_nomeEstrutura>.`

- Eu coloco só o campo sem nenhum `V_` ou `L_` ou `S_` pq, como já tá sendo declarada dentro de uma estrutura, eles já vão receber diretamente aquele `s_nomeEstrutura...` automaticamente.


- ATRIBUIÇÃO DE VALORES:

> `<s_nomeEstrutura>-<campo1> = <valor1>.`

> `<s_nomeEstrutura>-<campo2> = <'valor2'>.`

> `<s_nomeEstrutura>-<campo3> = <valor3>.`

- Sempre vai ter o nome da estrutura e um TRACINHO `-` pra definir o campo;
- Se eu aperto `ctrl + espaço`, ele me dá as sugestões de campos pra eu preencher.

- IMPRIMINDO OS CAMPOS:

> `WRITE <s_nomeEstrutura>-<campo1>.`

> `WRITE <s_nomeEstrutura>-<campo2>.`

> `WRITE <s_nomeEstrutura>-<campo3>.`
