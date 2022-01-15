import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_ticker.freezed.dart';
part 'day_ticker.g.dart';

@freezed
class BinanceDayTicker with _$BinanceDayTicker {
  factory BinanceDayTicker(
    String symbol,
    String priceChange,
    String priceChangePercent,
    String weightedAvgPrice,
    String prevClosePrice,
    String lastPrice,
    String lastQty,
    String bidPrice,
    String bidQty,
    String askPrice,
    String askQty,
    String openPrice,
    String highPrice,
    String lowPrice,
    String volume,
    String quoteVolume,
    int openTime,
    int closeTime,
    int firstId,
    int lastId,
    int count,
  ) = _BinanceDayTicker;

  factory BinanceDayTicker.fromJson(Map<String, dynamic> json) =>
      _$BinanceDayTickerFromJson(json);
}
