*&---------------------------------------------------------------------*
*& Report ZPS_DEMO_SALV2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zps_demo_salv2.

TABLES : vbak.

SELECT-OPTIONS : s_vbeln FOR vbak-vbeln.

TYPES : BEGIN OF lty_data,
          vbeln TYPE vbeln_va,
          erdat TYPE erdat,
          ernam TYPE ernam,
          erzet TYPE erzet,
          vbtyp TYPE vbtyp,
        END OF lty_data.

DATA : lt_data TYPE TABLE OF lty_data,
       ls_data TYPE lty_data.

TYPES : BEGIN OF lty_data1,
          vbeln TYPE vbeln_va,
          posnr TYPE posnr,
          matnr TYPE matnr,
        END OF lty_data1.

DATA : lt_data1 TYPE TABLE OF lty_data1,
       ls_data1 TYPE lty_data1.

DATA : lo_obj  TYPE REF TO cl_gui_custom_container.
DATA : lo_obj2  TYPE REF TO cl_gui_custom_container.
DATA : lcl_grid TYPE REF TO cl_gui_alv_grid.

IF lo_obj IS NOT BOUND.
  CREATE OBJECT lo_obj
    EXPORTING
      container_name = 'CONT1'.
ENDIF.

CLASS class1 DEFINITION.
  PUBLIC SECTION.
    METHODS handler FOR EVENT double_click OF cl_salv_events_table IMPORTING row column.
ENDCLASS.

CLASS class1 IMPLEMENTATION.
  METHOD handler.

*    DATA : lcl_grid TYPE REF TO cl_gui_alv_grid.

*    IF lcl_grid IS NOT BOUND.
*      CREATE OBJECT lcl_grid
*        EXPORTING
*          i_parent = lo_obj2.
*    ENDIF.

*    IF lo_obj2 IS NOT BOUND.
    CREATE OBJECT lo_obj2
      EXPORTING
        container_name = 'CONT2'.
*    ENDIF.

    READ TABLE lt_data INTO ls_data INDEX row.
    IF sy-subrc = 0.
      SELECT vbeln posnr matnr
      FROM vbap
      INTO TABLE lt_data1
      WHERE vbeln = ls_data-vbeln.
      DATA : lo_alv2 TYPE REF TO cl_salv_table.

      TRY.
          CALL METHOD cl_salv_table=>factory
            EXPORTING
*             list_display = IF_SALV_C_BOOL_SAP=>FALSE
              r_container  = lo_obj2
*             container_name =
            IMPORTING
              r_salv_table = lo_alv2
            CHANGING
              t_table      = lt_data1.
        CATCH cx_salv_msg .
      ENDTRY.

      DATA(lo_functions2) = lo_alv2->get_functions( ).
      lo_functions2->set_all( ).

      lo_alv2->display( ).

*      CALL FUNCTION 'GET_GLOBALS_FROM_SLVC_FULLSCR'
*        IMPORTING
*          e_grid = lcl_grid.
*
*      lcl_grid->check_changed_data( ).
**
*      CALL METHOD lcl_grid->refresh_table_display
*        EXCEPTIONS
*          finished = 1
*          OTHERS   = 2.
*      IF sy-subrc = 0.
*      ENDIF.

      lo_alv2->refresh( ).

    ENDIF.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  SELECT vbeln erdat ernam erzet vbtyp
  FROM vbak
  INTO TABLE lt_data
  WHERE vbeln IN s_vbeln.

  DATA : lo_alv TYPE REF TO cl_salv_table.

  TRY.
      CALL METHOD cl_salv_table=>factory
        EXPORTING
*         list_display = IF_SALV_C_BOOL_SAP=>FALSE
          r_container  = lo_obj
*         container_name =
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table      = lt_data.
    CATCH cx_salv_msg .


  ENDTRY.

  DATA(lo_functions) = lo_alv->get_functions( ).
  lo_functions->set_all( ).

  DATA(lo_events) = lo_alv->get_event( ).

  DATA(lo_obj1) = NEW class1( ).
  SET HANDLER lo_obj1->handler FOR lo_events.

  lo_alv->display( ).

  CALL SCREEN '0100'.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ORDER'.
  SET TITLEBAR 'ORD'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'BACK'.
    LEAVE TO SCREEN 0.
  ENDIF.
ENDMODULE.
