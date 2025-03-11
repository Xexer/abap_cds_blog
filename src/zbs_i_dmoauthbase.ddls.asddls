@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base for Auth Test'
define view entity ZBS_I_DMOAuthBase
  as select from ZBS_B_DMOAuthBase
{
  key Material,
      MaterialName,
      Description,
      Stock,
      Unit,
      PricePerUnit,
      Currency
}
