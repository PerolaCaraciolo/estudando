*&---------------------------------------------------------------------*
*&                  Include SEL - Tela de seleção
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK <b1> WITH FRAME TITLE text-001.
    PARAMETERS p_arq TYPE string OBLIGATORY.
SELECTION-SCREEN END OF BLOCK <b1>.

" Definição da ajuda de pesquisa
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_arq.
    PERFORM f_lista_f4.