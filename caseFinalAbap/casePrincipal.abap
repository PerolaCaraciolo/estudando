*&---------------------------------------------------------------------*
*&
*&                    CASE FINAL ACADEMIA SAP/ABAP
*&
*&---------------------------------------------------------------------*
REPORT ZI36_INTERFACES_SALESTOP MESSAGE-ID ZM36_CASE.

INCLUDE: zi36_interfaces_salestop_top,
         zi36_interfaces_salestop_sel,
         zi36_interfaces_salestop_f01.


INITIALIZATION.

    DATA ls_s_log TYPE bal_s_log.                 " Estrutura completa para o log

  " Preenche a estrutura de log com os valores necessários
         ls_s_log-object    = 'ZACADEMIA'.        " Nome do objeto (personalizado)
         ls_s_log-subobject = 'OUT24'.            " Subobjeto (contexto do log)
         ls_s_log-extnumber = sy-cprog.           " Número externo (programa atual)
         ls_s_log-aldate    = sy-datum.           " Data atual
         ls_s_log-altime    = sy-uzeit.           " Hora atual
         ls_s_log-aluser    = sy-uname.           " Usuário atual
         ls_s_log-alprog    = sy-repid.           " Nome do programa
         ls_s_log-altcode   = sy-tcode.           " Código da transação (se aplicável)

  " Chama a função para criar o log
    CALL FUNCTION 'BAL_LOG_CREATE'
      EXPORTING
         i_s_log       = ls_s_log                 " Passa a estrutura completa de log
      IMPORTING
         e_log_handle  = gv_log_handle.           " Recebe o handle do log
    IF sy-subrc <> 0.
      WRITE: / 'Erro ao criar log! Código do erro:', sy-subrc.
      EXIT.

    ELSE.
      PERFORM f_add_log_msg USING '000' ''.       " Sucesso no log (nº msg + parâmetro "agrupador")

                                     " ^^^^^ TROCAR POR VARIÁVEEEEEEEEEEEL (??????????????)
    ENDIF.


START-OF-SELECTION.

    PERFORM f_upload_arq.

END-OF-SELECTION.


                  "TESTE SÓ PRA EXIBIR AS TABELAS PRA ANALISAAAAAR
  " Exibir a tabela de cabeçalhos
    cl_demo_output=>display( EXPORTING data = t_header name = 'CABEÇALHOS' ).

  " Exibir a tabela de itens
    cl_demo_output=>display( EXPORTING data = t_item name = 'ITENS' ).

  " Exibir a tabela de preços
    cl_demo_output=>display( EXPORTING data = t_price name = 'PREÇOS' ).

  " Exibir a tabela de parceiros
    cl_demo_output=>display( EXPORTING data = t_partner name = 'PARCEIROS' ).




    PERFORM f_add_log_msg USING '001' ''.       " Mensagem do fim do processamento
 
    PERFORM f_save_log.                         " Salvar o log ao final do processamento








        "     ZTXXLOG_EXECUTION
                      " é pra eu criar essa tabela do final do arquivo



                      
        "           USO DAS MSGS!
*MESSAGE: i000, i001, s002, e003, w004 WITH 'PARÂMETRO', w005 WITH 'PARÂMETRO5', w006 WITH 'PARÂMETRO6', i007 WITH 'PARÂMETRO 007'.

*MESSAGE PELO CASE:
