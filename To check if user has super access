*&---------------------------------------------------------------------*
*& Report ZPS_SUPER_ACCESS
*&---------------------------------------------------------------------*
*& To check if the existing user has super access or not in the system.
**&---------------------------------------------------------------------*
REPORT zps_super_access.
TYPES: BEGIN OF lty_profile,
         bname   TYPE xubname,
         profile TYPE xuprofile,
       END OF lty_profile.

DATA : lt_profile  TYPE TABLE OF lty_profile,
       lwa_profile TYPE lty_profile.

DATA : lt_fieldcat  TYPE slis_t_fieldcat_alv,
       lwa_fieldcat TYPE slis_fieldcat_alv.

DATA :  lv_superuser TYPE char1.
PARAMETERS : p_usr TYPE sy-uname OBLIGATORY.

START-OF-SELECTION.
  SELECT bname profile
  FROM ust04
  INTO TABLE lt_profile
  WHERE bname = p_usr.

  IF sy-subrc = 0.

    LOOP AT lt_profile INTO lwa_profile.
      IF lwa_profile-profile = 'SAP_ALL' OR lwa_profile-profile = 'SAP_NEW'.
        lv_superuser = 'X'.
        EXIT.
      ELSE.
        lv_superuser = 'Y'.
      ENDIF.
    ENDLOOP.

    IF lv_superuser = 'X'.
      MESSAGE 'This user has super access' TYPE 'I'.
    ELSEIF
       lv_superuser = 'Y'.
      MESSAGE 'This user does not have super access' TYPE 'I'.
    ENDIF.

    IF lv_superuser = 'X'.
      lwa_fieldcat-row_pos = 1.
      lwa_fieldcat-col_pos = 1.
      lwa_fieldcat-fieldname = 'BNAME'.
      lwa_fieldcat-tabname = 'LT_PROFILE'.
      lwa_fieldcat-seltext_l = 'User ID'.
      APPEND lwa_fieldcat TO lt_fieldcat.
      CLEAR lwa_fieldcat.
      lwa_fieldcat-row_pos = 1.
      lwa_fieldcat-col_pos = 2.
      lwa_fieldcat-fieldname = 'PROFILE'.
      lwa_fieldcat-tabname = 'LT_PROFILE'.
      lwa_fieldcat-seltext_l = 'Profile'.
      APPEND lwa_fieldcat TO lt_fieldcat.
      CLEAR lwa_fieldcat.

      CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
        EXPORTING
*         
         I_CALLBACK_PROGRAM                = sy-repid
*        
          i_structure_name = 'UST04'
*        
        TABLES
          t_outtab         = lt_profile
        EXCEPTIONS
          program_error    = 1
          OTHERS           = 2.
      IF sy-subrc <> 0.
      ENDIF.
    ENDIF.
  ELSE.
    MESSAGE 'This user does not exit' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
