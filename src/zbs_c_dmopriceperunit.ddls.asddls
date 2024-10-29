@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exit in CDS'
define view entity ZBS_C_DmoPricePerUnit
  as select from ZBS_I_DmoPosition
{
  key DocumentNumber,
  key PositionNumber,
      ZBS_I_DmoPosition._Material.MaterialName,
      @Semantics.quantity.unitOfMeasure: 'PositionUnit'
      PositionQuantity,
      PositionUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PositionPrice,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_BS_DEMO_CDS_EXIT'
      cast( 0 as abap.curr(15,2) ) as PricePerUnit
}
