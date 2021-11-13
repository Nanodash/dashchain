/// The enum for the possible values of a symbol trading status in Binance API
class TradingStatus {
  final String _tradingStatus;

  const TradingStatus._(this._tradingStatus);

  /// When the symbol is available for trading
  static const TradingStatus trading = TradingStatus._('TRADING');

  /// When the symbol is in pre-trading phase (eg. about to be officially listed)
  static const TradingStatus preTrading = TradingStatus._('PRE_TRADING');

  /// When the symbol is in post-trading phase (eg. about to be officially delisted)
  static const TradingStatus postTrading = TradingStatus._('POST_TRADING');

  /// When the symbol is unavailable for trading (users may still cancel orders)
  static const TradingStatus endOfDay = TradingStatus._('END_OF_DAY');

  /// When the symbol is unavailable for trading due to some emergency situations (users may still cancel orders)
  static const TradingStatus halt = TradingStatus._('HALT');

  /// When the symbol is unavailable for trading because symbol is delisted or during expected downtime (users may still cancel orders)
  static const TradingStatus breakStatus = TradingStatus._('BREAK');

  /// Did not find any explanation
  static const TradingStatus auctionMatch = TradingStatus._('AUCTION_MATCH');

  @override
  String toString() => _tradingStatus;
}
