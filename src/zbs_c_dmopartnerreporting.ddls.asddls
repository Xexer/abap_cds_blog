@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reporting for Partners'
define view entity ZBS_C_DmoPartnerReporting
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_CalculationDate : abap.dats
  as select from ZBS_C_DmoPartnerSum
{
  key PartnerNumber,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PriceForPartnerMaterial,
      @Semantics.amount.currencyCode: 'CurrencyUSD'
      currency_conversion(
        amount => PriceForPartnerMaterial,
        source_currency => PositionCurrency,
        round => 'X',
        target_currency => cast( 'USD' as abap.cuky( 5 ) ),
        exchange_rate_date => $parameters.P_CalculationDate,
        exchange_rate_type => 'M',
        error_handling => 'SET_TO_NULL'
      )                               as PriceInUSD,
      cast( 'USD' as abap.cuky( 5 ) ) as CurrencyUSD
}
