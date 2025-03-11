CLASS ltc_cds_access DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA cds_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.

    METHODS without_access_control FOR TESTING.
    METHODS with_access_control    FOR TESTING.
ENDCLASS.


CLASS ltc_cds_access IMPLEMENTATION.
  METHOD class_setup.
    DATA double_data TYPE STANDARD TABLE OF ZBS_B_DMOAuthBase WITH EMPTY KEY.

    cds_environment = cl_cds_test_environment=>create( 'ZBS_I_DMOAuthBase' ).

    double_data = VALUE #( ( Material     = 'F001'
                             MaterialName = 'Find 1' )
                           ( Material     = 'F002'
                             MaterialName = 'Find 2' )
                           ( Material     = 'Z001'
                             MaterialName = 'Find 3' ) ).

    cds_environment->insert_test_data( double_data ).
  ENDMETHOD.


  METHOD class_teardown.
    cds_environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    cds_environment->get_access_control_double( )->disable_access_control( ).
  ENDMETHOD.


  METHOD without_access_control.
    SELECT FROM ZBS_I_DMOAuthBase
      FIELDS Material, MaterialName, Description
      INTO TABLE @DATA(data_with_restriction).

    cl_abap_unit_assert=>assert_equals( exp = 3
                                        act = lines( data_with_restriction ) ).
  ENDMETHOD.


  METHOD with_access_control.
    DATA(control_data) = cl_cds_test_data=>create_access_control_data( VALUE #( ) ).
    cds_environment->get_access_control_double( )->enable_access_control( control_data ).

    SELECT FROM ZBS_I_DMOAuthBase
      FIELDS Material, MaterialName, Description
      INTO TABLE @DATA(data_with_restriction).

    cl_abap_unit_assert=>assert_equals( exp = 2
                                        act = lines( data_with_restriction ) ).
  ENDMETHOD.
ENDCLASS.
