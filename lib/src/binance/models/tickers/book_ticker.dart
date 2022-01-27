import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_ticker.freezed.dart';
part 'book_ticker.g.dart';

@freezed
class BinanceBookTicker with _$BinanceBookTicker {
  factory BinanceBookTicker(
    String symbol,
    String bidPrice,
    String bidQty,
    String askPrice,
    String askQty,
  ) = _BinanceBookTicker;

  factory BinanceBookTicker.fromJson(Map<String, dynamic> json) =>
      _$BinanceBookTickerFromJson(json);
}
