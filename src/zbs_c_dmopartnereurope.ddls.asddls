@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Partner in Europe'
define view entity ZBS_C_DmoPartnerEurope
  as select from ZBS_I_DmoPartner
{
  key PartnerName,
      City,
      Country
}
where
     Country = 'DE'
  or Country = 'CH'
