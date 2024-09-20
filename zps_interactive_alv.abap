*&---------------------------------------------------------------------*
*& Report ZPS_INTERACTIVE_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zps_interactive_alv.

INCLUDE zps_int_alv_data.

INCLUDE zps_int_alv_sel_screen.

INCLUDE zps_int_alv_subroutines.

TOP-OF-PAGE.
  PERFORM topofpage.

START-OF-SELECTION.

  PERFORM get_data.

  PERFORM layout.

  IF r_class = 'X'.
    PERFORM dis_class.
  ELSEIF r_alv = 'X'.
    PERFORM dis_alv.
  ELSEIF r_pop = 'X'.
    PERFORM dis_pop .
  ENDIF.
