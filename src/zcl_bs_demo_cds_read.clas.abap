CLASS zcl_bs_demo_cds_read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bs_demo_cds_read IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM zbs_i_dmopartner
      FIELDS partnername, city, country
      WHERE country = 'DE' OR country = 'CH'
      INTO TABLE @DATA(lt_view_data).

    out->write( lt_view_data ).
  ENDMETHOD.
ENDCLASS.
