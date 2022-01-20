import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_ticker.freezed.dart';
part 'price_ticker.g.dart';

@freezed
class BinancePriceTicker with _$BinancePriceTicker {
  factory BinancePriceTicker(
    String symbol,
    String price,
  ) = _BinancePriceTicker;

  factory BinancePriceTicker.fromJson(Map<String, dynamic> json) =>
      _$BinancePriceTickerFromJson(json);
}
