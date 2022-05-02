@AbapCatalog.sqlViewName: 'ZBSIDMOPRIPERUNI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exit in CDS'
define view ZBS_C_DmoPricePerUnit
  as select from ZBS_I_DmoPosition
{
  key DocumentNumber,
  key PositionNumber,
      _Material.MaterialName,
      PositionQuantity,
      PositionPrice,
      PositionCurrency,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_BS_DEMO_CDS_EXIT'
      cast( 0 as abap.curr(15,2) ) as PricePerUnit
}
