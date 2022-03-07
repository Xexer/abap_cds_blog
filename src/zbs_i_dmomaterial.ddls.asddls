@AbapCatalog.sqlViewName: 'ZBSIDMOMATERIAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Material'
define view ZBS_I_DmoMaterial
  as select from zbs_dmo_material
{
  key material       as MaterialNumber,
      name           as MaterialName,
      description    as MaterialDescription,
      stock          as Stock,
      stock_unit     as StockUnit,
      price_per_unit as PricePerUnit,
      currency       as Currency
}
