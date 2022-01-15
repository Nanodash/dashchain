import 'package:freezed_annotation/freezed_annotation.dart';

part 'average_price.freezed.dart';
part 'average_price.g.dart';

@freezed
class BinanceAveragePrice with _$BinanceAveragePrice {
  factory BinanceAveragePrice(
    int mins,
    String price,
  ) = _BinanceAveragePrice;

  factory BinanceAveragePrice.fromJson(Map<String, dynamic> json) =>
      _$BinanceAveragePriceFromJson(json);
}
