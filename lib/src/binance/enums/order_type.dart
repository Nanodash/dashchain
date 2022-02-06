/// The enum for the possible types of an order
///
/// *(descriptions found at Binance [support](https://www.binance.com/en/support/faq/360033779452) website)*
enum OrderType {
  /// Limit Order allows you to place an order at a specific or a better price.
  /// A buy Limit Order will be filled if the price matches or is lower than your limit price,
  /// and a sell Limit Order will be filled at or higher than your limit price.
  ///
  /// *Please note that a Limit Order is not guaranteed to execute.*
  limit,

  /// Market orders are matched immediately at the best available price.
  market,

  /// Similar to a Stop Limit Order, a Stop Market Order uses a stop price to trigger the trade.
  /// However, when the stop price is reached, it triggers a market order instead.
  stopLoss,

  /// A Stop Limit order is a conditional order over a set timeframe,
  /// executed at a specified price after a given stop price has been reached.
  /// Once the stop price is reached, it will buy or sell at the limit price or
  /// at a better price than the limit price you set.
  stopLossLimit,

  /// This will execute a Market Order when the given stop price has been reached reached.
  takeProfit,

  /// This will execute a Limit Order when the given stop price has been reached
  takeProfitLimit,

  /// This is a LIMIT order that will be rejected if the order immediately matches and trades as a taker.
  /// This is also known as a POST-ONLY order.
  limitMaker,
}

extension OrderTypeAsString on OrderType {
  String get value {
    switch (this) {
      case OrderType.limit:
        return 'LIMIT';
      case OrderType.market:
        return 'MARKET';
      case OrderType.stopLoss:
        return 'STOP_LOSS';
      case OrderType.stopLossLimit:
        return 'STOP_LOSS_LIMIT';
      case OrderType.takeProfit:
        return 'TAKE_PROFIT';
      case OrderType.takeProfitLimit:
        return 'TAKE_PROFIT_LIMIT';
      case OrderType.limitMaker:
        return 'LIMIT_MAKER';
    }
  }
}
