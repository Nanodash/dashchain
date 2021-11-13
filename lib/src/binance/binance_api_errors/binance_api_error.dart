class BinanceApiError implements Exception {
  final int errorCode;
  final Object? message;

  const BinanceApiError(this.errorCode, [this.message]);

  @override
  String toString() => 'BinanceApiError($errorCode, $message)';
}
