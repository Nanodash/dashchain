/// The enum for the possible values of a symbol trading status in Binance API
enum BinanceTradingStatus {
  /// When the symbol is available for trading
  trading,

  /// When the symbol is in pre-trading phase (eg. about to be officially listed)
  preTrading,

  /// When the symbol is in post-trading phase (eg. about to be officially delisted)
  postTrading,

  /// When the symbol is unavailable for trading (users may still cancel orders)
  endOfDay,

  /// When the symbol is unavailable for trading due to some emergency situations (users may still cancel orders)
  halt,

  /// When the symbol is unavailable for trading because symbol is delisted or during expected downtime (users may still cancel orders)
  breakStatus,

  /// Did not find any explanation
  auctionMatch,
}

extension BinanceTradingStatusAsString on BinanceTradingStatus {
  String get value {
    switch (this) {
      case BinanceTradingStatus.trading:
        return 'TRADING';
      case BinanceTradingStatus.preTrading:
        return 'PRE_TRADING';
      case BinanceTradingStatus.postTrading:
        return 'POST_TRADING';
      case BinanceTradingStatus.endOfDay:
        return 'END_OF_DAY';
      case BinanceTradingStatus.halt:
        return 'HALT';
      case BinanceTradingStatus.breakStatus:
        return 'BREAK';
      case BinanceTradingStatus.auctionMatch:
        return 'AUCTION_MATCH';
    }
  }
}
