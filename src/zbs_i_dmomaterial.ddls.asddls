@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Material'
define view entity ZBS_I_DmoMaterial
  as select from zbs_dmo_material
  association [0..1] to I_Currency      as _Currency on $projection.Currency = _Currency.Currency
  association [0..1] to I_UnitOfMeasure as _Unit     on $projection.StockUnit = _Unit.UnitOfMeasure
{
  key material       as MaterialNumber,
      name           as MaterialName,
      description    as MaterialDescription,
      @Semantics.quantity.unitOfMeasure: 'STOCKUNIT' 
stock          as Stock,
      stock_unit     as StockUnit,
      @Semantics.amount.currencyCode: 'CURRENCY' 
price_per_unit as PricePerUnit,
      currency       as Currency,
      _Currency,
      _Unit
}
