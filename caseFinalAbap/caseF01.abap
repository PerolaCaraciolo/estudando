*&---------------------------------------------------------------------*
*&                  Include F01 - Subrotinas
*&---------------------------------------------------------------------*

FORM f_lista_f4.

    DATA: it_filetable TYPE filetable,
          l_rc         TYPE i.
    
    CALL METHOD cl_gui_frontend_services=>file_open_dialog
        EXPORTING
            window_title            = 'File Open'
        CHANGING
            file_table              = it_filetable
            rc                      = l_RC
        EXCEPTIONS
            file_open_dialog_failed = 1
            cntl_error              = 2
            error_no_gui            = 3
            OTHERS                  = 4.
    IF sy-subrc = 0.
    "MESSAGE s002.                      MSG DE VALIDAÇÃO DO ARQUIVO, NÃO É AQUI!   !!!!!!!!!!!!!!!!!!!!!!

        READ TABLE it_filetable INDEX 1 INTO v_filename.    " Análise arquivo recebido
        IF sy-subrc IS INITIAL.
            p_arq = v_filename.
        ENDIF.

    ELSE.
        PERFORM f_add_log_msg USING '003' ''.               " Erro ao ler o arquivo

    ENDIF.

ENDFORM.


FORM f_upload_arq.

    " Flag para controlar o processamento de itens
    DATA lv_item_processed TYPE abap_bool.

    " Armazenar o nome do arquivo da tela de seleção
    v_filename = p_arq.

    CALL FUNCTION 'GUI_UPLOAD'
        EXPORTING
            filename                = v_filename
            filetype                = 'ASC'
        TABLES
            data_tab                = t_upload
        EXCEPTIONS
            file_open_error         = 1
            file_read_error         = 2
            no_batch                = 3
            gui_refuse_filetransfer = 4
            invalid_type            = 5
            no_authority            = 6
            unknown_error           = 7
            bad_data_format         = 8
            header_not_allowed      = 9
            separator_not_allowed   = 10
            header_too_long         = 11
            unknown_dp_error        = 12
            access_denied           = 13
            dp_out_of_memory        = 14
            disk_full               = 15
            dp_timeout              = 16
            OTHERS                  = 17.
    IF sy-subrc <> 0.
        PERFORM f_add_log_msg USING '003' ''.               " Erro ao ler o arquivo

    ELSE.
        PERFORM f_add_log_msg USING '002' ''.               " Arquivo lido com sucesso

        LOOP AT t_upload INTO wa_upload.

            CLEAR lv_item_processed.                        " Limpar a flag

    " Identificar o tipo de linha e processar com base no identificador
            CASE wa_upload-dados+0(1).                      " Cada linha, primeiro caractere
                WHEN 'H'.                                   " Cabeçalho
                    SPLIT wa_upload-dados AT ';'
                            INTO wa_header-identificador
                                    wa_header-agrupador
                                    wa_header-doc_tipo
                                    wa_header-org_vendas
                                    wa_header-canal
                                    wa_header-setor
                                    wa_header-ext_pedido.
    " Verificar se todos os campos obrigatórios do cabeçalho estão preenchidos
                    IF wa_header-doc_tipo IS INITIAL OR wa_header-agrupador IS INITIAL.
                        PERFORM f_add_log_msg USING '003' wa_header-agrupador.       " Erro ao ler o arquivo

                    ENDIF.
                        APPEND wa_header TO t_header.
                        CLEAR wa_header.

                WHEN 'I'.                                   " Item
                    SPLIT wa_upload-dados AT ';'
                            INTO wa_item-identificador
                                    wa_item-agrupador
                                    wa_item-posicao
                                    wa_item-material
                                    wa_item-quantidade
                                    wa_item-unid_medida
                                    wa_item-planta.
    " Verificar se o item tem um cabeçalho correspondente
                    READ TABLE t_header WITH KEY agrupador = wa_item-agrupador TRANSPORTING NO FIELDS.
                    IF sy-subrc <> 0.
                        PERFORM f_add_log_msg USING '004' wa_item-agrupador.         " Não existem itens para o Identificador
                        lv_item_processed = abap_false.                              " Indica que o item não foi processado
                        CONTINUE.                                                    " Pular o processamento deste item
                    
                    ENDIF.
                        APPEND wa_item TO t_item.
                        lv_item_processed = abap_true.                               " Item foi processado com sucesso
                        CLEAR wa_item.

                WHEN 'V'.                                   " Preço
    " Se o item correspondente ao preço não foi processado, pular o processamento do preço
                    IF lv_item_processed = abap_false.
                        CONTINUE.                                                    " Pular o processamento do preço
                    ENDIF.

                    SPLIT wa_upload-dados AT ';'
                            INTO wa_price-identificador
                                    wa_price-agrupador
                                    wa_price-posicao
                                    wa_price-preco.
    " Verificar se o preço está presente
                    IF wa_price-preco IS INITIAL.
                        PERFORM f_add_log_msg USING '005' wa_price-agrupador.       " Não existem preços para o Identificador
    " Remover o item correspondente ao preço inválido
                        DELETE t_item WHERE agrupador = wa_price-agrupador.
                        CONTINUE.                                                   " Pular o processamento do preço
                    ENDIF.

    " Verificar se o item correspondente ao preço existe
                    READ TABLE t_item WITH KEY agrupador = wa_price-agrupador TRANSPORTING NO FIELDS.
                    IF sy-subrc <> 0.
                        PERFORM f_add_log_msg USING '005' wa_price-agrupador.       " Não existem preços para o Identificador
    " Remover o item, pois o preço não tem item correspondente válido
                        DELETE t_item WHERE agrupador = wa_price-agrupador.
                        CONTINUE.

                    ENDIF.
                        APPEND wa_price TO t_price.
                        CLEAR wa_price.

                WHEN 'P'.                                   " Parceiro
                    SPLIT wa_upload-dados AT ';'
                            INTO wa_partner-identificador
                                    wa_partner-agrupador
                                    wa_partner-tipo
                                    wa_partner-cliente.
    " Verificar se o parceiro tem um cabeçalho correspondente
                    READ TABLE t_header WITH KEY agrupador = wa_partner-agrupador TRANSPORTING NO FIELDS.
                    IF sy-subrc <> 0.
                    PERFORM f_add_log_msg USING '006' wa_partner-agrupador.        " Não existem Parceiros para o Identificador
                    CONTINUE.
                    ENDIF.

    " Verificar se o campo cliente está vazio
                    IF wa_partner-cliente IS INITIAL.
                        PERFORM f_add_log_msg USING '006' wa_partner-agrupador.    " Cliente vazio
                        CONTINUE.
                    ENDIF.

    " Verificar se já existe mais de um parceiro para o mesmo cabeçalho
                    READ TABLE t_partner WITH KEY agrupador = wa_partner-agrupador TRANSPORTING NO FIELDS.
                    IF sy-subrc = 0.
                        PERFORM f_add_log_msg USING '007' wa_partner-agrupador.     " Mais de um parceiro associado
                        CONTINUE.

                    ENDIF.
    " Se tudo estiver correto, adicionar o parceiro à tabela
                        APPEND wa_partner TO t_partner.
                        CLEAR wa_partner.

                WHEN OTHERS.
                    WRITE: / 'Identificador desconhecido na linha: ', wa_upload-dados.
            ENDCASE.

        ENDLOOP.

    ENDIF.

ENDFORM.


FORM f_add_log_msg USING p_code  TYPE string
                         p_msgv1 TYPE char4.

    DATA: lv_msgty TYPE symsgty,
          lv_msgno TYPE symsgno,
          ls_msg   TYPE bal_s_msg.                          " Estrutura de mensagem completa para o log.

    " Definir o tipo da mensagem com base no parâmetro de código
    CASE p_code.
        WHEN '000'.  " Início do processamento
            lv_msgty = 'I'.
            lv_msgno = '000'.
        WHEN '001'.  " Fim do processamento
            lv_msgty = 'I'.
            lv_msgno = '001'.
        WHEN '002'.  " Sucesso na leitura do arquivo
            lv_msgty = 'S'.
            lv_msgno = '002'.
        WHEN '003'.  " Erro ao ler o arquivo
            lv_msgty = 'E'.
            lv_msgno = '003'.
        WHEN '004'.  " Aviso - Ausência de itens
            lv_msgty = 'W'.
            lv_msgno = '004'.
        WHEN '005'.  " Aviso - Ausência de preços
            lv_msgty = 'W'.
            lv_msgno = '005'.
        WHEN '006'.  " Aviso - Ausência de parceiros
            lv_msgty = 'W'.
            lv_msgno = '006'.
        WHEN '007'.  " Informação - Ordem de venda não apta
            lv_msgty = 'I'.
            lv_msgno = '007'.
        WHEN OTHERS.
            WRITE: / 'Código de mensagem desconhecido:', p_code.
            RETURN.
    ENDCASE.

    " Salva o log antes de exibir a mensagem de erro
    IF lv_msgno = '003'.
        PERFORM f_save_log.
    ENDIF.

    " Exibir a mensagem diretamente para o usuário
    MESSAGE ID 'ZM36_CASE' TYPE lv_msgty NUMBER lv_msgno WITH p_msgv1.

    " Preencher a estrutura de mensagem com o tipo, número e parâmetros
    ls_msg-msgty = lv_msgty.                                " Tipo de mensagem (S, E, W, I)
    ls_msg-msgid = 'ZM36_CASE'.                             " ID fixo da classe de mensagens
    ls_msg-msgno = lv_msgno.                                " Número da mensagem
    ls_msg-msgv1 = p_msgv1.                                 " Valor dinâmico para substituição de &


    " Chama a função de log com a mensagem configurada
    CALL FUNCTION 'BAL_LOG_MSG_ADD'
        EXPORTING
            i_log_handle  = gv_log_handle
            i_s_msg       = ls_msg.                         " Passa a estrutura completa de mensagem
    IF sy-subrc <> 0.
        WRITE: / 'Erro ao adicionar mensagem ao log. Código do erro:', sy-subrc.           " CONFERIR SE NÃO É MELHOR DEIXAR NA MSG OU NNNNNN??????????
    ENDIF.

ENDFORM.


FORM f_save_log.

    " Chama a função de salvar o log no banco de dados
    CALL FUNCTION 'BAL_DB_SAVE'.

    IF sy-subrc <> 0.
        WRITE: / 'Erro ao salvar o log. Código do erro:', sy-subrc.
    ELSE.
        WRITE: / 'Log salvo com sucesso!'.
    ENDIF.

ENDFORM.