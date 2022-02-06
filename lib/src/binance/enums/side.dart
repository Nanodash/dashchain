/// The enum for the possible values of a trade side
enum Side { buy, sell }

extension SideAsString on Side {
  String get value {
    switch (this) {
      case Side.buy:
        return 'BUY';
      case Side.sell:
        return 'SELL';
    }
  }
}
