@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Session information'
define view entity ZBS_C_DmoInvoiceSession
  as select from ZBS_I_DmoInvoice
{
  key DocumentNumber,
      DocumentDate,
      $session.system_language as SystemLanguage
}
where
  DocumentDate < $session.system_date
