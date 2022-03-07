@AbapCatalog.sqlViewName: 'ZBSIDMODISCOUNT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Discount'
define view ZBS_I_DmoDiscount
  as select from zbs_dmo_discount
{
  key partner  as PartnerNumber,
  key material as MaterialNumber,
      discount as DiscountValue
}
