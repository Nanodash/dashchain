/// The enum for the possible values of the time in force parameter
enum TimeInForce {
  /// ***G**ood '**T**il **C**anceled*
  ///
  /// An order will be on the book unless the order is canceled.
  gtc,

  /// ***I**mmediate **O**r **C**ancel*
  ///
  /// An order will try to fill the order as much as it can before the order expires.
  ioc,

  /// ***F**ill **O**r **K**ill*
  ///
  /// An order will expire if the full order cannot be filled upon execution.
  fok,
}

extension TimeInForceAsString on TimeInForce {
  String get value {
    switch (this) {
      case TimeInForce.gtc:
        return 'GTC';
      case TimeInForce.ioc:
        return 'IOC';
      case TimeInForce.fok:
        return 'FOK';
    }
  }
}
