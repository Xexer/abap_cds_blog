@AbapCatalog.sqlViewName: 'ZBSCDMOPARSUM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum for Partner'
define view ZBS_C_DmoPartnerSum
  as select from ZBS_I_DmoPosition
{
  key _Invoice.PartnerNumber,
      @Semantics.currencyCode: true
      PositionCurrency,
      sum ( PositionPrice ) as PriceForPartnerMaterial

}
group by
  _Invoice.PartnerNumber,
  PositionCurrency
