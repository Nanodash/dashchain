extension NumToPrecision on double {
  /// A method to only keep the given number of digits in `this` double
  double toPrecision(int precision) => double.parse(toStringAsFixed(precision));
}
