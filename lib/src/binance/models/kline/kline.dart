class BinanceKline {
  final int openTime;
  final String openPrice;
  final String highPrice;
  final String lowPrice;
  final String closePrice;
  final String volume;
  final int closeTime;
  final String quoteAssetVolume;
  final int trades;
  // https://dev.binance.vision/t/taker-buy-base-asset-volume/6026/2
  // Hi.
  // Taker buy base asset volume represents how many of the total base asset volume are contributed by the taker buy orders. Once taker_buy_base_asset_volume and the total volume (Volume) is known, the value of the following cases ( taker_sell_volume, maker_buy_volume, maker_sell_volume ) are clear.
  // Every trade has a buyer and a seller. A buyer can be a maker or a taker. But when a buyer is a maker, the seller must be a taker, and vice versa. That is,
  // taker_buy_base_asset_volume = maker_sell_base_asset_volume
  // taker_sell_base_asset_volume = maker_buy_base_asset_volume
  // total_volume = taker_buy_base_asset_volume + taker_sell_base_asset_volume = maker_buy_base_asset_volume + maker_sell_base_asset_volume
  // Please do not take the field “Ignore” seriously. This field is deprecated.
  final String takerBuyBaseAssetVolume;
  final String takerBuyQuoteAssetVolume;
  final String ignore;

  const BinanceKline(
    this.openTime,
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.closePrice,
    this.volume,
    this.closeTime,
    this.quoteAssetVolume,
    this.trades,
    this.takerBuyBaseAssetVolume,
    this.takerBuyQuoteAssetVolume,
    this.ignore,
  );

  @override
  String toString() {
    return 'BinanceKline('
        'openTime: $openTime, '
        'openPrice: $openPrice, '
        'highPrice: $highPrice, '
        'lowPrice: $lowPrice, '
        'closePrice: $closePrice, '
        'volume: $volume, '
        'closeTime: $closeTime, '
        'quoteAssetVolume: $quoteAssetVolume, '
        'trades: $trades, '
        'takerBuyBaseAssetVolume: $takerBuyBaseAssetVolume, '
        'takerBuyQuoteAssetVolume: $takerBuyQuoteAssetVolume, '
        'ignore: $ignore'
        ')';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BinanceKline &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.closePrice, closePrice) ||
                other.closePrice == closePrice) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.quoteAssetVolume, quoteAssetVolume) ||
                other.quoteAssetVolume == quoteAssetVolume) &&
            (identical(other.trades, trades) || other.trades == trades) &&
            (identical(
                    other.takerBuyBaseAssetVolume, takerBuyBaseAssetVolume) ||
                other.takerBuyBaseAssetVolume == takerBuyBaseAssetVolume) &&
            (identical(
                    other.takerBuyQuoteAssetVolume, takerBuyQuoteAssetVolume) ||
                other.takerBuyQuoteAssetVolume == takerBuyQuoteAssetVolume) &&
            (identical(other.ignore, ignore) || other.ignore == ignore));
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        openTime,
        openPrice,
        highPrice,
        lowPrice,
        closePrice,
        volume,
        closeTime,
        quoteAssetVolume,
        trades,
        takerBuyBaseAssetVolume,
        takerBuyQuoteAssetVolume,
        ignore,
      );

  factory BinanceKline.fromJson(List kline) => BinanceKline(
        kline[0],
        kline[1],
        kline[2],
        kline[3],
        kline[4],
        kline[5],
        kline[6],
        kline[7],
        kline[8],
        kline[9],
        kline[10],
        kline[11],
      );
}
