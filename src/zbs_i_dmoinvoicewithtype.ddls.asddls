@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice with Types'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBS_I_DmoInvoiceWithType
  as select from zbs_dmo_invoice
{
  key document                                                as Document,
      doc_date                                                as DocumentDate,
      doc_time                                                as DocumentTime,
      partner                                                 as PartnerNumber,
      cast( 'C' as ZBS_DemoCDSInvoiceStatus preserving type ) as StatusSimpleType,
      ZBS_DemoCDSInvoiceStatusEnum.#Payed                     as StatusEnumType
}
