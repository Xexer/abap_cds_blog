@AbapCatalog.sqlViewName: 'ZBSCDMOPARAMRE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck:  #NOT_REQUIRED
@EndUserText.label: 'Reuse with parameters'
define view ZBS_C_DmoParameterReuse
  with parameters
    P_Date : abap.dats
  as select from ZBS_C_DmoParameter(
                 P_Date : $parameters.P_Date,
                 P_Type : 'A',
                 P_Field : 'From Outer'
                 )
{
  key DocumentNumber,
      DocumentDate,
      Status,
      ImportedField
}
