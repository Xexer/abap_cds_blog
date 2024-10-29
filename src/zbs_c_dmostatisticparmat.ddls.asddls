@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Statistic for high performer'
define view entity ZBS_C_DmoStatisticParMat
  as select from ZBS_C_DmoPartnerMaterialSum   as Combine
    inner join   ZBS_C_DmoPartnerMaterialCount as Numbers on  Combine.PartnerNumber  = Numbers.PartnerNumber
                                                          and Combine.MaterialNumber = Numbers.MaterialNumber
{
  key Combine.PartnerNumber,
  key Combine.MaterialNumber,
      Combine.PositionCurrency,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY' 
Combine.PriceForPartnerMaterial,
      Numbers.NumberOfDocuments
}
where
      Numbers.NumberOfDocuments       >= 10
  and Combine.PriceForPartnerMaterial <= 100000
