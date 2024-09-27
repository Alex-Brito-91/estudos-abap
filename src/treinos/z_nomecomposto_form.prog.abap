*&---------------------------------------------------------------------*
*& Include          Z_NOMECOMPOSTO_FORM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_checnome
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_checnome .

  DO 5 TIMES.
    v_delimiter = v_delimiters+v_counter1(1).

    v_counter2 = 0.
    DO strlen( p_nome ) TIMES.
      IF p_nome+v_counter2(1) = v_delimiter.
        SPLIT p_nome AT v_delimiter
        INTO v_pnome
             v_snome.
        EXIT.
      ENDIF.
      v_counter2 = v_counter2 + 1.

    ENDDO.

    v_counter1 = v_counter1 + 1.
  ENDDO.

  IF v_pnome = p_nome.
    WRITE: p_nome, v_fcomp,
          / 'Tamanho do nome: ', strlen( v_pnome ) .
  ELSE.
    WRITE: p_nome, v_tcomp,
           / 'Tamanho do primeiro nome:', strlen( v_pnome ),
           / 'Tamanho do segundo nome:', strlen( v_snome ).
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_nchecnome
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_nchecnome .
  DO 5 TIMES.
    v_delimiter = v_delimiters+v_counter1(1).
    FIND v_delimiter IN p_nome.
* A variável sy-subrc armazena a condição se deu certo ou não uma operação feita anteriormente. É uma variável de sistema. 0 -> Encontrou ; 1 -> Não encontrou :(
    IF sy-subrc = 0.
      v_achou = 1.
      EXIT.
    ENDIF.

    v_counter1 = v_counter1 + 1.
  ENDDO.

  SPLIT p_nome AT v_delimiter
          INTO v_pnome
               v_snome.

  IF v_pnome = p_nome.
    WRITE: p_nome, v_fcomp,
          / 'Tamanho do nome: ', strlen( v_pnome ) .
  ELSE.
    WRITE: p_nome, v_tcomp,
           / 'Tamanho do primeiro nome:', strlen( v_pnome ),
           / 'Tamanho do segundo nome:', strlen( v_snome ).
  ENDIF.
ENDFORM.
