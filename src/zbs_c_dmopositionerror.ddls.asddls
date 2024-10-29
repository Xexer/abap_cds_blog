@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Positions with error'
define view entity ZBS_C_DmoPositionError
  as select from ZBS_I_DmoPosition
{
  key DocumentNumber,
  key PositionNumber,
      MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositionUnit'
      PositionQuantity,
      PositionUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PositionPrice,
      PositionCurrency,
      case PositionPrice
        when 37707 then 'X'
        else ' '
      end as ErrorInConversion
}
