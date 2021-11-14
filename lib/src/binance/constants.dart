/// Binance's base domain name
const String binanceDomain = 'binance.com';

/// The default URI to use when interacting with Binance Rest API
const String defaultUri = 'api.$binanceDomain';

/// The base path for Binance's _REST API_
const String apiPath = '/api/v3';

/// The header given in Binance's API response representing the current quota. Should be tracked to avoid IP bans.
const String xMbxUsedWeightHeader = 'x-mbx-used-weight';

// -------- GENERAL ENDPOINTS --------
/// A basic endpoint that may reflect API availability/performance
const String pingPath = '/ping';

/// A basic endpoint that may reflect API availability/performance.
/// It will also return the current server time using Epoch time in milliseconds.
const String timePath = '/time';

/// The endpoint to get exchange info about symbols
const String exchangeInfoPath = '/exchangeInfo';
// -----------------------------------

// ------ MARKET DATA ENDPOINTS ------
const String orderBookPath = '/depth';
// -----------------------------------
