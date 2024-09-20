*&---------------------------------------------------------------------*
*&  Include           ZPS_INT_ALV_SEL_SCREEN
*&---------------------------------------------------------------------*
 SELECTION-SCREEN : BEGIN OF BLOCK b1 WITH FRAME.
  SELECT-OPTIONS : empid FOR zps_emp_data-emp_id DEFAULT 'EID001' TO 'EID015'.
  SELECTION-SCREEN : END OF BLOCK b1.

  SELECTION-SCREEN : BEGIN OF BLOCK b2 WITH FRAME.
  PARAMETERS : r_class RADIOBUTTON GROUP r1,
               r_alv RADIOBUTTON GROUP r1 DEFAULT 'X',
               r_pop RADIOBUTTON GROUP r1.
  SELECTION-SCREEN : END OF BLOCK b2.
