*&---------------------------------------------------------------------*
*&  Include           ZPS_INT_ALV_SUBROUTINES
*&---------------------------------------------------------------------*

FORM layout.
  lt_layout-zebra = 'X'.
  lt_layout-colwidth_optimize = 'X'.
  lt_layout-edit = 'X'.
ENDFORM.

FORM pf_status USING extab TYPE slis_t_extab.
  SET TITLEBAR 'TITLE'.
  SET PF-STATUS 'PF-STATUS'.
ENDFORM.



FORM topofpage .
  IF r_class = 'X'.
    WRITE : / 'Employee ID', 15 'Employee name', 35 'Department ID', 55 'Date of joining', 75 'Salary'.
  ENDIF.
ENDFORM.

FORM dis_class .

  LOOP AT lt_emp INTO ls_emp.
    WRITE : / ls_emp-emp_id, 15 ls_emp-emp_name, 35 ls_emp-dept_id, 55 ls_emp-join_date, 71 ls_emp-salary.
  ENDLOOP.

ENDFORM.



FORM field_cat .

  ls_fieldcat-col_pos = '1'.
  ls_fieldcat-fieldname = 'EMP_ID'.
  ls_fieldcat-tabname = 'LT_EMP'.
  ls_fieldcat-seltext_l = 'Employee ID'.
  ls_fieldcat-edit     = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.

  ls_fieldcat-col_pos = '2'.
  ls_fieldcat-fieldname = 'EMP_NAME'.
  ls_fieldcat-tabname = 'LT_EMP'.
  ls_fieldcat-seltext_l = 'Employee Name'.
  ls_fieldcat-edit     = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.

  ls_fieldcat-col_pos = '3'.
  ls_fieldcat-fieldname = 'DEPT_ID'.
  ls_fieldcat-tabname = 'LT_EMP'.
  ls_fieldcat-seltext_l = 'Department ID'.
  ls_fieldcat-edit     = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.

  ls_fieldcat-col_pos = '4'.
  ls_fieldcat-fieldname = 'JOIN_DATE'.
  ls_fieldcat-tabname = 'LT_EMP'.
  ls_fieldcat-seltext_l = 'Date of Joining'.
  ls_fieldcat-edit     = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.

  ls_fieldcat-col_pos = '5'.
  ls_fieldcat-fieldname = 'SALARY'.
  ls_fieldcat-tabname = 'LT_EMP'.
  ls_fieldcat-seltext_l = 'Salary'.
  ls_fieldcat-edit     = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.
  CLEAR ls_fieldcat.

ENDFORM.

FORM dis_header.

  REFRESH lt_he.

  CALL FUNCTION 'ZPS_DATE_FORMAT'
    IMPORTING
      lv_fdate = lv_date.
  .

  ls_he-typ = 'S'.
  ls_he-key = lv_date.


  APPEND ls_he TO lt_he.
  CLEAR ls_he.

  ls_he-typ = 'H'.
  ls_he-info = TEXT-001.


  APPEND ls_he TO lt_he.
  CLEAR ls_he.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_he.


ENDFORM.

FORM user_command USING p_ucomm TYPE sy-ucomm
                      p_selfield TYPE slis_selfield.

  IF go_alv_grid IS INITIAL.
    CREATE OBJECT go_alv_grid
      EXPORTING
        i_parent = cl_gui_container=>screen0.
  ENDIF.

  CASE p_ucomm.

    WHEN 'SAVE'.
      CALL METHOD go_alv_grid->check_changed_data
        IMPORTING
          e_valid = lv_value.

      IF lv_value = abap_true.
        LOOP AT lt_emp INTO ls_emp.
          READ TABLE lt_emp1 INTO ls_emp1 INDEX sy-tabix.
          IF ls_emp1 <> ls_emp .
            MODIFY zps_emp_data FROM ls_emp.
            MESSAGE 'Data has been saved' TYPE 'S'.
          ELSE.
            MESSAGE 'No changes are made' TYPE 'E'.
          ENDIF.

        ENDLOOP.
      ENDIF.

    WHEN 'DELETE'.
      READ TABLE lt_emp INTO ls_emp INDEX p_selfield-tabindex.
      DELETE FROM zps_emp_data WHERE emp_id = ls_emp-emp_id.
      IF sy-subrc = 0.
        REFRESH lt_emp.
        SELECT * FROM zps_emp_data INTO TABLE lt_emp.
        CLEAR ls_emp.
        MESSAGE 'Data Deleted successfully' TYPE 'S'.
      ELSE.
        MESSAGE 'Error occured while deleting' TYPE 'E'.
      ENDIF.

    WHEN 'ADD'.
      APPEND ls_emp TO lt_emp.
      CLEAR ls_emp.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'EXIT'.
      LEAVE PROGRAM.

  ENDCASE.

  p_selfield-refresh = 'X'.
  p_selfield-col_stable = 'X'.
  p_selfield-row_stable = 'X'.

ENDFORM.



FORM dis_alv.
  PERFORM field_cat.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = sy-repid
      i_callback_pf_status_set = 'PF_STATUS '
      i_callback_user_command  = 'USER_COMMAND'
      i_callback_top_of_page   = 'DIS_HEADER'
      is_layout                = lt_layout
      it_fieldcat              = lt_fieldcat
*     IT_EXCLUDING             =
*     IT_SPECIAL_GROUPS        =
*     IT_SORT                  =
*     IT_FILTER                =
*     IS_SEL_HIDE              =
      i_default                = 'X'
      i_save                   = 'X'
*     IS_VARIANT               =
*     IT_EVENTS                =
*     IT_EVENT_EXIT            =
    TABLES
      t_outtab                 = lt_emp
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.



ENDFORM.

FORM dis_pop.

  PERFORM field_cat.

  CALL FUNCTION 'REUSE_ALV_POPUP_TO_SELECT'
    EXPORTING
      i_title       = 'EMP_DATA'
      i_selection   = 'X'
      i_tabname     = 'LT_EMP'
*     I_STRUCTURE_NAME     =
      it_fieldcat   = lt_fieldcat
*     IT_EXCLUDING  =
*     I_CALLBACK_PROGRAM   =
*     I_CALLBACK_USER_COMMAND       =
*     IS_PRIVATE    =
*     IMPORTING
*     ES_SELFIELD   =
*     E_EXIT        =
    TABLES
      t_outtab      = lt_emp
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.

FORM get_data.
  SELECT *
  FROM zps_emp_data
  INTO TABLE lt_emp
  WHERE emp_id IN empid.
  IF sy-subrc <> 0.
    MESSAGE 'This ID does not exist' TYPE 'E'.
  ENDIF.

ENDFORM.

































