@AbapCatalog.sqlViewName: 'ZBSCDMOPOSERR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Positions with error'
define view ZBS_C_DmoPositionError
  as select from ZBS_I_DmoPosition
{
  key DocumentNumber,
  key PositionNumber,
      MaterialNumber,
      PositionQuantity,
      PositionPrice,
      PositionCurrency,
      case PositionPrice
        when 37707 then 'X'
        else ' '
      end as ErrorInConversion
}
