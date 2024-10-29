@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Substring for month'
define view entity ZBS_C_DmoInvoiceSubstring
  as select from ZBS_I_DmoInvoice
{
  key DocumentNumber,
      DocumentDate,
      substring( DocumentDate, 5, 2 ) as MonthInDocumentDate,
      PartnerNumber
}
