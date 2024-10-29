@AbapCatalog.sqlViewName: 'ZBSIDMOUNION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union example'
define view ZBS_I_DmoUnion
  as select from ZBS_C_DmoPositionError
{

  key DocumentNumber,
  key PositionNumber,
      'Normal' as PositionType,
      PositionPrice,
      PositionCurrency
}
where
  ErrorInConversion = ' '
union select from ZBS_C_DmoPositionError
{

  key DocumentNumber,
  key PositionNumber,
      'Error'                      as PositionType,
      cast( 0 as abap.curr(15,2) ) as PositionPrice,
      PositionCurrency
}
where
  ErrorInConversion = 'X'
