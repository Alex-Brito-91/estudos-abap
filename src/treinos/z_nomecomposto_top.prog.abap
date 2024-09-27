*&---------------------------------------------------------------------*
*& Include          Z_NOMECOMPOSTO_TOP
*&---------------------------------------------------------------------*

DATA: v_tcomp TYPE c LENGTH 20 VALUE 'É um nome composto',
      v_fcomp TYPE c LENGTH 23 VALUE 'Não é um nome composto',
      v_pnome TYPE c LENGTH 15,
      v_snome TYPE c LENGTH 15,
      v_delimiters TYPE c LENGTH 5 VALUE ',-;/ ',
      v_delimiter TYPE c LENGTH 1,
      v_counter1 TYPE i VALUE 0,
      v_counter2 TYPE i VALUE 0,
      v_achou TYPE i VALUE 0.
