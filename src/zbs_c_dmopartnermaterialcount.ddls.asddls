@AbapCatalog.sqlViewName: 'ZBSCDMOPAMATCNT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Count for Partner and Material'
define view ZBS_C_DmoPartnerMaterialCount
  as select from ZBS_I_DmoPosition
{
  key _Invoice.PartnerNumber,
  key MaterialNumber,
      count( * ) as NumberOfDocuments
}
group by
  _Invoice.PartnerNumber,
  MaterialNumber
