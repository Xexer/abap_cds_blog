@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Extension'
define view entity ZBS_C_DmoDiscountExtension
  as select from ZBS_I_DmoDiscount
{
  key PartnerNumber,
  key MaterialNumber,
      DiscountValue,
      ZBS_I_DmoDiscount._Material.MaterialName,
      ZBS_I_DmoDiscount._Material.MaterialDescription
}
