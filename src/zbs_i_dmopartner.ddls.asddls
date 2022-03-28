@AbapCatalog.sqlViewName: 'ZBSIDMOPARTNER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Partner'
define view ZBS_I_DmoPartner
  as select from zbs_dmo_partner
  association [0..1] to I_Country  as _Country  on $projection.Country = _Country.Country
  association [0..1] to I_Currency as _Currency on $projection.PaymentCurrency = _Currency.Currency
{
  key partner          as PartnerNumber,
      name             as PartnerName,
      street           as Street,
      city             as City,
      country          as Country,
      payment_currency as PaymentCurrency,
      _Country,
      _Currency
}
