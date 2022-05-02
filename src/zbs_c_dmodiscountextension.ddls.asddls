@AbapCatalog.sqlViewName: 'ZBSCDMODISEXT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Extension'
define view ZBS_C_DmoDiscountExtension
  as select from ZBS_I_DmoDiscount
{
  key PartnerNumber,
  key MaterialNumber,
      DiscountValue,
      _Material.MaterialName,
      _Material.MaterialDescription
}
