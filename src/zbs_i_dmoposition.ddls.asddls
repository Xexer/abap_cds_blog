@AbapCatalog.sqlViewName: 'ZBSIDMOPOSITION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Position'
define view ZBS_I_DmoPosition
  as select from zbs_dmo_position
  association [0..1] to ZBS_I_DmoInvoice  as _Invoice  on $projection.DocumentNumber = _Invoice.DocumentNumber
  association [0..1] to ZBS_I_DmoMaterial as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key document            as DocumentNumber,
  key pos_number          as PositionNumber,
      material            as MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositionUnit'
      quantity            as PositionQuantity,
      _Material.StockUnit as PositionUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency' 
      price               as PositionPrice,
      currency            as PositionCurrency,
      _Invoice,
      _Material
}
