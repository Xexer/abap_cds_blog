@AbapCatalog.sqlViewName: 'ZBSIDMOCOMPDOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Complete Invoice Document'
define view ZBS_I_DmoCompleteDocument
  as select from ZBS_I_DmoPosition as Position
    inner join   ZBS_I_DmoInvoice  as Head    on Head.DocumentNumber = Position.DocumentNumber
    inner join   ZBS_I_DmoPartner  as Partner on Partner.PartnerNumber = Head.PartnerNumber
{
  key Position.DocumentNumber,
  key Position.PositionNumber,
      Head.PartnerNumber,
      Partner.PartnerName,
      Partner.City,
      Partner.Country,
      Position.MaterialNumber,
      Position.PositionQuantity,
      Position.PositionPrice,
      Position.PositionCurrency,
      Head.DocumentDate
}
