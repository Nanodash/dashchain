/// Binance's base domain name.
const String binanceDomain = 'binance.com';

/// The default URI to use when interacting with Binance's _REST API_.
const String defaultUri = 'api.$binanceDomain';

/// The base path for Binance's _REST API_.
const String apiPath = '/api/v3';

/// The header given in Binance's API response representing the current quota. Should be tracked to avoid IP bans.
const String xMbxUsedWeightHeader = 'x-mbx-used-weight';

/// The header that should be used to pass the API key needed fore some endpoints.
const String xMbxApiKeyHeader = 'x-mbx-apikey';

// -------- GENERAL ENDPOINTS --------
/// A basic endpoint that may reflect API availability/performance.
const String pingPath = '/ping';

/// A basic endpoint that may reflect API availability/performance.
/// It will also return the current server time using Epoch time in milliseconds.
const String timePath = '/time';

/// The endpoint to get exchange info about symbols.
const String exchangeInfoPath = '/exchangeInfo';
// -----------------------------------

// ------ MARKET DATA ENDPOINTS ------
/// The endpoint to get the Order Book for a specific symbol.
const String orderBookPath = '/depth';

/// The endpoint to get the latest trades for a specific symbol.
const String tradesPath = '/trades';

/// The endpoint to get the historical trades for a specific symbol.
const String historicalTradesPath = '/historicalTrades';

/// The endpoint to get the aggregated trades for a specific symbol.
const String aggregatedTradesPath = '/aggTrades';

/// The endpoint to get the klines (or candlesticks) for a specific symbol.
const String klinesPath = '/klines';

/// The endpoint to get the average price for a specific symbol.
const String avgPricePath = '/avgPrice';

/// The endpoint to get the 24hr statistics symbol(s).
const String dayTickerPath = '/ticker/24hr';

/// The endpoint to get the current price of symbol(s).
const String priceTickerPath = '/ticker/price';
// -----------------------------------
