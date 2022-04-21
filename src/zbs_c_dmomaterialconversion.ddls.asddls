@AbapCatalog.sqlViewName: 'ZBSCDMOMATCONV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversion for units'
define view ZBS_C_DmoMaterialConversion
  as select from ZBS_I_DmoMaterial
{
  key MaterialNumber,
      MaterialName,
      Stock,
      StockUnit,
      unit_conversion(
        quantity => Stock,
        source_unit => StockUnit,
        target_unit => cast( 'ST' as abap.unit( 3 ) ),
        error_handling => 'SET_TO_NULL'
      ) as UnitInPieces
}
