*&---------------------------------------------------------------------*
*& Report Z_ABAS_TELA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_ABAS_TELA.

TABLES: sbook.

SELECTION-SCREEN BEGIN OF SCREEN 110 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
    SELECT-OPTIONS: s_carrid FOR sbook-carrid NO INTERVALS,
                    s_connid FOR sbook-connid NO INTERVALS.
  SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 110.

SELECTION-SCREEN BEGIN OF SCREEN 120 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.
    SELECT-OPTIONS: s_agency FOR sbook-agencynum NO INTERVALS,
                    s_psname FOR sbook-passname.
  SELECTION-SCREEN END OF BLOCK b2.
SELECTION-SCREEN END OF SCREEN 120.

SELECTION-SCREEN BEGIN OF TABBED BLOCK tab_block FOR 13 LINES.
  SELECTION-SCREEN TAB (20) tab1 USER-COMMAND comm1 DEFAULT SCREEN 110.
  SELECTION-SCREEN TAB (20) tab2 USER-COMMAND comm2 DEFAULT SCREEN 120.
SELECTION-SCREEN END OF BLOCK tab_block.

INITIALIZATION.
  tab1 = 'Dados Vôo'(010).
  tab2 = 'Dados Cliente'(011).

START-OF-SELECTION.

SELECT carrid, connid, agencynum, passname
  FROM sbook
  INTO TABLE @DATA(lt_sbook)
    WHERE carrid  IN @s_carrid
    AND connid    IN @s_connid
    AND agencynum IN @s_agency
    AND passname  IN @s_psname.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = DATA(lo_alv)
  CHANGING
    t_table = lt_sbook[]
).
DATA(lo_functions) = lo_alv->get_functions( ).
lo_functions->set_all( ).
lo_alv->display( ).
