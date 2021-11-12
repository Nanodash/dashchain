/// Binance's base domain name
const String binanceDomain = 'binance.com';

/// The base path for Binance's _REST API_
const String apiPath = '/api/v3';

/// The default endpoint to use when interacting with Binance Rest API
const String baseEndpoint = 'https://api.$binanceDomain$apiPath';

/// A basic endpoint that may reflect API availability/performance
const String pingPath = '/ping';

/// A basic endpoint that may reflect API availability/performance.
/// It will also return the current server time using Epoch time in milliseconds.
const String timePath = '/time';

/// The endpoint to get exchange info about symbols
const String exchangeInfoPath = '/exchangeInfo';

/// The status returned by Binance API when this symbol is available for trading
const String tradeableStatus = 'TRADING';
