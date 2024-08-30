*&---------------------------------------------------------------------*
*&  Include           ZPS_SUPER_ACCESS_DATA
*&---------------------------------------------------------------------*
TYPES: BEGIN OF lty_profile,
         bname   TYPE xubname,
         profile TYPE xuprofile,
       END OF lty_profile.

DATA : lt_profile  TYPE TABLE OF lty_profile,
       lwa_profile TYPE lty_profile.

DATA : lt_fieldcat  TYPE slis_t_fieldcat_alv,
       lwa_fieldcat TYPE slis_fieldcat_alv.

DATA :  lv_superuser TYPE char1.
