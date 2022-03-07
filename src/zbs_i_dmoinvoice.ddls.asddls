@AbapCatalog.sqlViewName: 'ZBSIDMOINVOICE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Invoice'
define view ZBS_I_DmoInvoice
  as select from zbs_dmo_invoice
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber
}
