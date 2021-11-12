import 'package:freezed_annotation/freezed_annotation.dart';

part 'binance_symbol.freezed.dart';
part 'binance_symbol.g.dart';

@freezed
class BinanceSymbol with _$BinanceSymbol {
  factory BinanceSymbol(
    String symbol,
    String status,
    String baseAsset,
    int baseAssetPrecision,
    String quoteAsset,
    int quotePrecision,
    int quoteAssetPrecision,
    int baseCommissionPrecision,
    int quoteCommissionPrecision,
    List<String> orderTypes,
    bool icebergAllowed,
    bool ocoAllowed,
    bool quoteOrderQtyMarketAllowed,
    bool isSpotTradingAllowed,
    bool isMarginTradingAllowed,
    List<Map<String, dynamic>> filters,
    List<String> permissions,
  ) = _BinanceSymbol;

  factory BinanceSymbol.fromJson(Map<String, dynamic> json) =>
      _$BinanceSymbolFromJson(json);
}
