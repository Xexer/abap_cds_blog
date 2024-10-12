CLASS zcl_bs_demo_cds_read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BS_DEMO_CDS_READ IMPLEMENTATION.


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

    " Association
    SELECT FROM zbs_i_dmoinvoice
      FIELDS documentnumber, partnernumber, \_partner-partnername, \_partner-city
      INTO TABLE @DATA(lt_association)
      UP TO 10 ROWS.

    out->write( lt_association ).

    " Complete Document
    SELECT FROM ZBS_I_DmoPosition
      FIELDS  DocumentNumber,
              PositionNumber,
              \_Invoice-PartnerNumber,
              \_Invoice\_Partner-PartnerName,
              \_Invoice\_Partner-City,
              \_Invoice\_Partner-Country,
              MaterialNumber,
              PositionQuantity,
              PositionPrice,
              PositionCurrency,
              \_Invoice-DocumentDate
      INTO TABLE @DATA(lt_full_with_association)
      UP TO 20 ROWS.

    out->write( lt_full_with_association ).

    " Parameters
    SELECT FROM ZBS_C_DmoParameter(
        p_date = '20210422',
        p_type = 'C',
        p_field = 'Program'
      )
      FIELDS *
      INTO table@DATA(lt_parameter).

    out->write( lt_parameter ).
  ENDMETHOD.
ENDCLASS.
