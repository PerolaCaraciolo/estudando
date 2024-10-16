*&---------------------------------------------------------------------*
*&                Include TOP - Declaração de variáveis
*&---------------------------------------------------------------------*

    " Estruturas
    " Define o tipo para armazenar cada linha do arquivo
TYPES: BEGIN OF ty_upload,
         dados TYPE char1000sf,
       END OF ty_upload,

    " Cabeçalho da ordem de venda
       BEGIN OF ty_header,
         identificador TYPE char1,
         agrupador     TYPE char4,
         doc_tipo      TYPE char4,
         org_vendas    TYPE char4,
         canal         TYPE char2,
         setor         TYPE char2,
         ext_pedido    TYPE char10,
       END OF ty_header,

    " Itens da ordem de venda
       BEGIN OF ty_item,
         identificador TYPE char1,
         agrupador     TYPE char4,
         posicao       TYPE char6,
         material      TYPE char18,
         quantidade    TYPE char30,
         unid_medida   TYPE char3,
         planta        TYPE char4,
       END OF ty_item,

    " Preços dos itens
       BEGIN OF ty_price,
         identificador TYPE char1,
         agrupador     TYPE char4,
         posicao       TYPE char6,
         preco         TYPE char30,
       END OF ty_price,

    " Parceiros da ordem de venda
       BEGIN OF ty_partner,
         identificador TYPE char1,
         agrupador     TYPE char4,
         tipo          TYPE char3,
         cliente       TYPE char10,
       END OF ty_partner.


    " Tabelas Internas
DATA: t_upload  TYPE TABLE OF ty_upload,      " Conteúdo completo do arquivo
      t_header  TYPE TABLE OF ty_header,      " Cabeçalhos
      t_item    TYPE TABLE OF ty_item,        " Itens
      t_price   TYPE TABLE OF ty_price,       " Preços
      t_partner TYPE TABLE OF ty_partner.     " Parceiros


    " WorkArea
DATA: wa_upload  TYPE ty_upload,
      wa_header  TYPE ty_header,
      wa_item    TYPE ty_item,
      wa_price   TYPE ty_price,
      wa_partner TYPE ty_partner.


DATA:  v_filename    TYPE string,
       gv_log_handle TYPE balloghndl.          " Handle do log