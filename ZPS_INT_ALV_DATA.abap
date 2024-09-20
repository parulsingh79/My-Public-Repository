*&---------------------------------------------------------------------*
*&  Include           ZPS_INT_ALV_DATA
*&---------------------------------------------------------------------*
TABLES : zps_emp_data.

DATA : lt_emp TYPE TABLE OF zps_emp_data,
       ls_emp TYPE zps_emp_data.

DATA : lt_emp1 TYPE TABLE OF zps_emp_data,
       ls_emp1 TYPE zps_emp_data.

DATA : lt_fieldcat TYPE slis_t_fieldcat_alv,
       ls_fieldcat TYPE slis_fieldcat_alv.

DATA : lt_he TYPE slis_t_listheader,
       ls_he TYPE slis_listheader.

DATA :  lt_layout   TYPE slis_layout_alv.

DATA : lv_value TYPE abap_bool.
DATA : go_alv_grid TYPE REF TO cl_gui_alv_grid.

DATA : lv_date TYPE char12.
