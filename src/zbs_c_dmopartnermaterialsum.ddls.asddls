@AbapCatalog.sqlViewName: 'ZBSCDMOPAMATSUM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum for Partner and Material'
define view ZBS_C_DmoPartnerMaterialSum
  as select from ZBS_I_DmoPosition
{
  key _Invoice.PartnerNumber,
  key MaterialNumber,
      @Semantics.currencyCode: true
      PositionCurrency,
      sum ( PositionPrice ) as PriceForPartnerMaterial

}
group by
  _Invoice.PartnerNumber,
  MaterialNumber,
  PositionCurrency
