@AbapCatalog.sqlViewName: 'ZBSIDMODISCOUNT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Discount'
define view ZBS_I_DmoDiscount
  as select from zbs_dmo_discount
  association [0..1] to ZBS_I_DmoPartner  as _Partner  on $projection.PartnerNumber = _Partner.PartnerNumber
  association [0..1] to ZBS_I_DmoMaterial as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key partner  as PartnerNumber,
  key material as MaterialNumber,
      discount as DiscountValue,
      _Partner,
      _Material
}
