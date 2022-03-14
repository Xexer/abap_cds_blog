@AbapCatalog.sqlViewName: 'ZBSCDMODISCAST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cast from number'
define view ZBS_C_DmoDicountCast
  as select from ZBS_I_DmoDiscount
{
  key PartnerNumber,
  key MaterialNumber,
      DiscountValue,
      concat( cast( DiscountValue as abap.char(15) ), ' %' ) as DiscountText
}
