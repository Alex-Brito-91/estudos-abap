*&---------------------------------------------------------------------*
*& Report Z_NOMECOMPOSTO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_NOMECOMPOSTO.

INCLUDE: Z_NOMECOMPOSTO_top,
         Z_NOMECOMPOSTO_sel,
         Z_NOMECOMPOSTO_form.

START-OF-SELECTION.

*PERFORM f_checnome.

* Oi
PERFORM f_nchecnome.

END-OF-SELECTION.
