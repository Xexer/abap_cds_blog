@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum for Partner'
define view entity ZBS_C_DmoPartnerSum
  as select from ZBS_I_DmoPosition
{
  key ZBS_I_DmoPosition._Invoice.PartnerNumber,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY' 
sum ( PositionPrice ) as PriceForPartnerMaterial

}
group by
  ZBS_I_DmoPosition._Invoice.PartnerNumber,
  PositionCurrency
