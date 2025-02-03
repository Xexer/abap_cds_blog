CLASS zcl_bs_demo_rap_fill_team DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_bs_demo_rap_fill_team IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA team_members TYPE STANDARD TABLE OF zbs_dmo_team WITH EMPTY KEY.

    team_members = VALUE #( ( user_id         = 'P0020'
                              player_name     = 'Lester P. Riley'
                              player_email    = 'LesterPRiley@einrot.com'
                              player_position = 'Manager'
                              score           = '0.00'
                              team            = 'Proud SNC'
                              team_leader     = '' )
                            ( user_id         = 'P0021'
                              player_name     = 'Brayden Zichy-Woinarski'
                              player_email    = 'BraydenZichy-Woinarski@einrot.com'
                              player_position = 'Coach'
                              score           = '1465'
                              team            = 'Proud SNC'
                              team_leader     = 'P0020' )
                            ( user_id         = 'P0022'
                              player_name     = 'Yong Wang'
                              player_email    = 'YongWang@cuvox.de'
                              player_position = 'Mid-Lane'
                              score           = '2100'
                              team            = 'Proud SNC'
                              team_leader     = 'P0020' )
                            ( user_id         = 'P0023'
                              player_name     = 'Garland Robert'
                              player_email    = 'GarlandRobert@cuvox.de'
                              player_position = 'Bot-Lane'
                              score           = '2200'
                              team            = 'Proud SNC'
                              team_leader     = 'P0020' )
                            ( user_id         = 'P0024'
                              player_name     = 'Søren C. Nilsson'
                              player_email    = 'SorenCNilsson@einrot.com'
                              player_position = 'Jungle'
                              score           = '1925'
                              team            = 'Proud SNC'
                              team_leader     = 'P0020' )
                            ( user_id         = 'P0025'
                              player_name     = 'Emily Correia Oliveira'
                              player_email    = 'EmilyCorreiaOliveira@cuvox.de'
                              player_position = 'Manager'
                              score           = '0.00'
                              team            = 'Wasteland'
                              team_leader     = '' )
                            ( user_id         = 'P0026'
                              player_name     = 'Erin Chandler'
                              player_email    = 'ErinChandler@einrot.com'
                              player_position = 'Coach'
                              score           = '2000'
                              team            = 'Wasteland'
                              team_leader     = 'P0025' )
                            ( user_id         = 'P0027'
                              player_name     = 'Panu Sibelius'
                              player_email    = 'PanuSibelius@cuvox.de'
                              player_position = 'Jungle'
                              score           = '2122'
                              team            = 'Wasteland'
                              team_leader     = 'P0025' )
                            ( user_id         = 'P0028'
                              player_name     = 'Katharina Fuerst'
                              player_email    = 'KatharinaFuerst@einrot.com'
                              player_position = 'Bot-Lane'
                              score           = '1980'
                              team            = 'Wasteland'
                              team_leader     = 'P0025' ) ).

    DELETE FROM zbs_dmo_team.
    INSERT zbs_dmo_team FROM TABLE @team_members.
    COMMIT WORK.
  ENDMETHOD.
ENDCLASS.
