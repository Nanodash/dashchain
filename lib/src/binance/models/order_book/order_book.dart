import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_book.freezed.dart';
part 'order_book.g.dart';

@freezed
class BinanceOrderBook with _$BinanceOrderBook {
  factory BinanceOrderBook(
    int lastUpdateId,
    List<List<String>> bids,
    List<List<String>> asks,
  ) = _BinanceOrderBook;

  factory BinanceOrderBook.fromJson(Map<String, dynamic> json) =>
      _$BinanceOrderBookFromJson(json);
}
