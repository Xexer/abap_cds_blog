@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New view type'
define view entity ZBS_I_DmoNewView
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_Date : abap.dats
  as select from zbs_dmo_invoice
  association [0..*] to ZBS_I_DmoPosition as _Position on $projection.DocumentNumber = _Position.DocumentNumber
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber,
      _Position
}
where
  doc_date = $parameters.P_Date
