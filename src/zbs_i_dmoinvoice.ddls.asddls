@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Invoice'
define view entity ZBS_I_DmoInvoice
  as select from zbs_dmo_invoice as Invoice
  association [0..*] to ZBS_I_DmoPosition as _Position on $projection.DocumentNumber = _Position.DocumentNumber
  association [0..1] to ZBS_I_DmoPartner  as _Partner  on $projection.PartnerNumber = _Partner.PartnerNumber
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber,
      _Position,
      _Partner
}
