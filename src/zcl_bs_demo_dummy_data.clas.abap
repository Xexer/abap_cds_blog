CLASS zcl_bs_demo_dummy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CONSTANTS:
      c_error                     TYPE zbs_dmo_position-price VALUE '37707',
      c_number_of_invoices        TYPE i VALUE 300,
      c_days_back_from_today      TYPE i VALUE 365,
      c_max_number_of_positions   TYPE i VALUE 3,
      c_max_quantity_per_position TYPE i VALUE 5.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      mt_partner         TYPE STANDARD TABLE OF zbs_dmo_partner,
      mt_material        TYPE STANDARD TABLE OF zbs_dmo_material,
      mt_discount        TYPE STANDARD TABLE OF zbs_dmo_discount,
      mt_head            TYPE STANDARD TABLE OF zbs_dmo_invoice,
      mt_position        TYPE STANDARD TABLE OF zbs_dmo_position,

      mo_random_partner  TYPE REF TO zcl_bs_demo_random,
      mo_random_date     TYPE REF TO zcl_bs_demo_random,
      mo_random_position TYPE REF TO zcl_bs_demo_random,
      mo_random_material TYPE REF TO zcl_bs_demo_random,
      mo_random_quantity TYPE REF TO zcl_bs_demo_random.

    METHODS:
      create_partner,

      create_material,

      create_discount,

      create_invoice
        IMPORTING
          id_count TYPE i,

      create_head
        RETURNING
          VALUE(rs_result) TYPE zbs_dmo_invoice,

      create_positions
        IMPORTING
          is_head TYPE zbs_dmo_invoice.
ENDCLASS.



CLASS ZCL_BS_DEMO_DUMMY_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    create_partner( ).
    out->write( |Partner: { lines( mt_partner ) }| ).

    create_material( ).
    out->write( |Material: { lines( mt_material ) }| ).

    create_discount( ).
    out->write( |Discount: { lines( mt_discount ) }| ).

    create_invoice( c_number_of_invoices ).
    out->write( |Invoice: { lines( mt_head ) }| ).
    out->write( |Position: { lines( mt_position ) }| ).
  ENDMETHOD.


  METHOD create_partner.
    mt_partner = VALUE #(
      ( partner = '1000000000' name = 'SAP' street = 'Demo Street 15' city = 'Walldorf' country = 'DE' payment_currency = 'EUR' )
      ( partner = '1000000001' name = 'Microsoft' street = 'Demo Street 24' city = 'Redmond' country = 'US' payment_currency = 'USD' )
      ( partner = '1000000002' name = 'Meta' street = 'Fox Street 1' city = 'Menlo Park' country = 'US' payment_currency = 'USD' )
      ( partner = '1000000003' name = 'Alibaba' street = 'Alley 15' city = 'Hangzhou' country = 'CN' payment_currency = 'CNY' )
      ( partner = '1000000004' name = 'BMW' street = 'Main Avenue 200' city = 'Munich' country = 'DE' payment_currency = 'EUR' )
      ( partner = '1000000005' name = 'Nestle' street = 'Village Alley 14' city = 'Vevey' country = 'CH' payment_currency = 'CHF' )
      ( partner = '1000000006' name = 'Gazprom' street = 'Peace Avenue 1' city = 'Sankt Petersburg' country = 'RU' payment_currency = 'RUB' )
    ).

    DELETE FROM zbs_dmo_partner.
    INSERT zbs_dmo_partner FROM TABLE @mt_partner.
  ENDMETHOD.


  METHOD create_material.
    mt_material = VALUE #(
      ( material = 'F0001'
        name = 'Peanuts'
        description = 'Roasted Peanuts from US'
        stock = '900'
        stock_unit = 'ST'
        price_per_unit = '2.50'
        currency = 'USD' )
      ( material = 'F0002'
        name = 'Rice'
        description = 'Big bag rice from china'
        stock = '120'
        stock_unit = 'BAG'
        price_per_unit = '12.00'
        currency = 'USD' )
      ( material = 'F0003'
        name = 'Eggs'
        description = 'Eggs from happy german chickens'
        stock = '550'
        stock_unit = 'PAK'
        price_per_unit = '3.15'
        currency = 'EUR' )
      ( material = 'H0001'
        name = 'USB Stick 128 GB'
        description = 'USB Stick with security features'
        stock = '30'
        stock_unit = 'ST'
        price_per_unit = '49.99'
        currency = 'EUR' )
      ( material = 'H0002'
        name = 'OLED Display 34"'
        description = 'Big and wide display with HDMI and dsiplay port'
        stock = '18'
        stock_unit = 'ST'
        price_per_unit = '440.00'
        currency = 'USD' )
      ( material = 'R0001'
        name = 'Gas'
        description = 'Gas from sibiria'
        stock = '50000'
        stock_unit = 'MMQ'
        price_per_unit = '1560.00'
        currency = 'RUB' )
    ).

    DELETE FROM zbs_dmo_material.
    INSERT zbs_dmo_material FROM TABLE @mt_material.
  ENDMETHOD.


  METHOD create_discount.
    mt_discount = VALUE #(
      ( partner = '1000000000' material = 'F0003' discount = '10.00' )
      ( partner = '1000000001' material = 'F0001' discount = '15.00' )
      ( partner = '1000000001' material = 'H0002' discount = '3.50' )
      ( partner = '1000000006' material = 'R0001' discount = '7.50' )
    ).

    DELETE FROM zbs_dmo_discount.
    INSERT zbs_dmo_discount FROM TABLE @mt_discount.
  ENDMETHOD.


  METHOD create_invoice.
    DO id_count TIMES.
      DATA(ls_head) = create_head( ).
      create_positions( ls_head ).
    ENDDO.

    DELETE FROM zbs_dmo_invoice.
    INSERT zbs_dmo_invoice FROM TABLE @mt_head.
    DELETE FROM zbs_dmo_position.
    INSERT zbs_dmo_position FROM TABLE @mt_position.
  ENDMETHOD.


  METHOD create_head.
    DATA:
      ld_document TYPE n LENGTH 8 VALUE 30000000.

    IF mo_random_partner IS INITIAL.
      mo_random_partner = NEW #( id_min = 1 id_max = lines( mt_partner ) ).
      mo_random_date = NEW #( id_min = 1 id_max = c_days_back_from_today ).
    ENDIF.

    rs_result = VALUE #(
      document = ld_document + lines( mt_head )
      doc_date = CONV d( cl_abap_context_info=>get_system_date( ) - mo_random_date->rand( ) )
      doc_time = cl_abap_context_info=>get_system_time( )
      partner = mt_partner[ mo_random_partner->rand( ) ]-partner
    ).

    INSERT rs_result INTO TABLE mt_head.
  ENDMETHOD.


  METHOD create_positions.
    IF mo_random_position IS INITIAL.
      mo_random_position = NEW #( id_min = 1 id_max = c_max_number_of_positions ).
      mo_random_material = NEW #( id_min = 1 id_max = lines( mt_material ) ).
      mo_random_quantity = NEW #( id_min = 1 id_max = c_max_quantity_per_position ).
    ENDIF.

    DO mo_random_position->rand( ) TIMES.
      DATA(ld_index) = sy-index.
      DATA(ls_material) = mt_material[ mo_random_material->rand( ) ].
      DATA(ld_quantity) = mo_random_quantity->rand( ).

      TRY.
          DATA(ld_discount) = mt_discount[ partner = is_head-partner material = ls_material-material ]-discount.
        CATCH cx_sy_itab_line_not_found.
          ld_discount = 0.
      ENDTRY.

      DATA(ls_position) = VALUE zbs_dmo_position(
        document = is_head-document
        pos_number = ld_index
        material = ls_material-material
        quantity = ld_quantity
        price = ( ld_quantity * ls_material-price_per_unit ) * ( 1 - ld_discount / 100 )
        currency = mt_partner[ partner = is_head-partner ]-payment_currency
      ).

      TRY.
          SELECT SINGLE FROM zbs_dmo_discount
            FIELDS
              currency_conversion(
                amount = @ls_position-price,
                source_currency = @ls_material-currency,
                target_currency = @ls_position-currency,
                exchange_rate_date = @is_head-doc_date,
                round = @abap_true
              ) AS price
            INTO @ls_position-price.

        CATCH cx_sy_open_sql_db.
          ls_position-price = c_error.
      ENDTRY.

      INSERT ls_position INTO TABLE mt_position.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
