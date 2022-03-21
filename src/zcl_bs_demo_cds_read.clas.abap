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
    " Demo SELECT
    SELECT FROM zbs_i_dmopartner
      FIELDS partnername, city, country
      WHERE country = 'DE' OR country = 'CH'
      INTO TABLE @DATA(lt_view_data).

    out->write( lt_view_data ).

    " Join CDS
    SELECT FROM zbs_i_dmocompletedocument
      FIELDS documentnumber, partnername, country, positionprice, positioncurrency
      WHERE positionnumber = 1
      ORDER BY documentnumber
      INTO TABLE @DATA(lt_full)
      UP TO 20 ROWS.

    out->write( lt_full ).

    " Union Select
    SELECT FROM zbs_i_dmounion
      FIELDS *
      WHERE documentnumber BETWEEN '30000010' AND '30000020'
      ORDER BY documentnumber, positionnumber
      INTO TABLE @DATA(lt_union).

    out->write( lt_union ).
  ENDMETHOD.
ENDCLASS.
