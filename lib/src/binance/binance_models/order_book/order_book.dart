import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_book.freezed.dart';
part 'order_book.g.dart';

@freezed
class OrderBook with _$OrderBook {
  factory OrderBook(
    int lastUpdateId,
    List<List<String>> bids,
    List<List<String>> asks,
  ) = _OrderBook;

  factory OrderBook.fromJson(Map<String, dynamic> json) =>
      _$OrderBookFromJson(json);
}
