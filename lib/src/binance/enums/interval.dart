/// The enum for the possible values of a symbol trading status in Binance API
enum Interval {
  // minutes
  /// 1 minute interval
  m1,

  /// 3 minutes interval
  m3,

  /// 5 minutes interval
  m5,

  /// 15 minutes interval
  m15,

  /// 30 minutes interval
  m30,

  // hours
  /// 1 hour interval
  h1,

  /// 2 hours interval
  h2,

  /// 4 hours interval
  h4,

  /// 6 hours interval
  h6,

  /// 8 hours interval
  h8,

  /// 12 hours interval
  h12,

  // days
  /// 1 day interval
  d1,

  /// 3 days interval
  d3,

  // weeks
  /// 1 week interval
  w1,

  /// 1 month interval
  w4,
}

extension IntervalsAsString on Interval {
  String get value {
    switch (this) {
      case Interval.m1:
        return '1m';
      case Interval.m3:
        return '3m';
      case Interval.m5:
        return '5m';
      case Interval.m15:
        return '15m';
      case Interval.m30:
        return '30m';
      case Interval.h1:
        return '1h';
      case Interval.h2:
        return '2h';
      case Interval.h4:
        return '4h';
      case Interval.h6:
        return '6h';
      case Interval.h8:
        return '8h';
      case Interval.h12:
        return '12h';
      case Interval.d1:
        return '1d';
      case Interval.d3:
        return '3d';
      case Interval.w1:
        return '1w';
      case Interval.w4:
        return '1M';
    }
  }
}
