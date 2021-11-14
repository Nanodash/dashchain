/// The enum for the possible values of a symbol trading status in Binance API
class BinanceTradingStatus {
  final String _tradingStatus;

  const BinanceTradingStatus._(this._tradingStatus);

  /// When the symbol is available for trading
  static const BinanceTradingStatus trading = BinanceTradingStatus._('TRADING');

  /// When the symbol is in pre-trading phase (eg. about to be officially listed)
  static const BinanceTradingStatus preTrading =
      BinanceTradingStatus._('PRE_TRADING');

  /// When the symbol is in post-trading phase (eg. about to be officially delisted)
  static const BinanceTradingStatus postTrading =
      BinanceTradingStatus._('POST_TRADING');

  /// When the symbol is unavailable for trading (users may still cancel orders)
  static const BinanceTradingStatus endOfDay =
      BinanceTradingStatus._('END_OF_DAY');

  /// When the symbol is unavailable for trading due to some emergency situations (users may still cancel orders)
  static const BinanceTradingStatus halt = BinanceTradingStatus._('HALT');

  /// When the symbol is unavailable for trading because symbol is delisted or during expected downtime (users may still cancel orders)
  static const BinanceTradingStatus breakStatus =
      BinanceTradingStatus._('BREAK');

  /// Did not find any explanation
  static const BinanceTradingStatus auctionMatch =
      BinanceTradingStatus._('AUCTION_MATCH');

  @override
  String toString() => _tradingStatus;
}
