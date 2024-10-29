@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Count for Partner and Material'
define view entity ZBS_C_DmoPartnerMaterialCount
  as select from ZBS_I_DmoPosition
{
  key ZBS_I_DmoPosition._Invoice.PartnerNumber,
  key MaterialNumber,
      count( * ) as NumberOfDocuments
}
group by
  ZBS_I_DmoPosition._Invoice.PartnerNumber,
  MaterialNumber
