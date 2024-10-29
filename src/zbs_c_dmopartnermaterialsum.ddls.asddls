@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum for Partner and Material'
define view entity ZBS_C_DmoPartnerMaterialSum
  as select from ZBS_I_DmoPosition
{
  key ZBS_I_DmoPosition._Invoice.PartnerNumber,
  key MaterialNumber,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY' 
sum ( PositionPrice ) as PriceForPartnerMaterial

}
group by
  ZBS_I_DmoPosition._Invoice.PartnerNumber,
  MaterialNumber,
  PositionCurrency
