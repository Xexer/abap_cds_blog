CLASS zcl_bs_demo_cds_authority DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_bs_demo_cds_authority IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZBS_I_DMOAuthBase
      FIELDS Material, MaterialName, Description
      INTO TABLE @DATA(data_with_restriction).

    out->write( data_with_restriction ).
    out->write( `---` ).

    SELECT FROM ZBS_I_DMOAuthBase
      FIELDS Material, MaterialName, Description
      INTO TABLE @DATA(data_without_restriction)
      PRIVILEGED ACCESS.

    out->write( data_without_restriction ).
  ENDMETHOD.
ENDCLASS.
