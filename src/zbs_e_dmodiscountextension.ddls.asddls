@AbapCatalog.sqlViewAppendName: 'ZBSEDMODISEXT'
@EndUserText.label: 'Extension for ZBS_C_DmoDiscountExtension'
extend view ZBS_C_DmoDiscountExtension with ZBS_E_DmoDiscountExtension
{
  _Partner.PartnerName
}
