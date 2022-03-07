@AbapCatalog.sqlViewName: 'ZBSIDMOPOSITION'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Position'
define view ZBS_I_DmoPosition
  as select from zbs_dmo_position
{
  key document   as DocumentNumber,
  key pos_number as PositionNumber,
      material   as MaterialNumber,
      quantity   as PositionQuantity,
      price      as PositionPrice,
      currency   as PositionCurrency
}
