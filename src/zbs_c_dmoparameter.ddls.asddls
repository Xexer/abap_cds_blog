@AbapCatalog.sqlViewName: 'ZBSCDMOPARAM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with parameter'
define view ZBS_C_DmoParameter
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_Date  : abap.dats,
    @Consumption.defaultValue: 'A'
    P_Type  : abap.char( 1 ),
    P_Field : abap.char( 10 )
  as select from ZBS_I_DmoInvoice
{
  key DocumentNumber,
      DocumentDate,
      _Partner.PartnerName,
      _Partner.Country,
      case $parameters.P_Type
        when 'A' then 'New'
        when 'B' then 'Old'
        else 'Unknown'
      end                 as Status,
      $parameters.P_Field as ImportedField
}
where
  DocumentDate = $parameters.P_Date
