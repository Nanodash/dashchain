## 0.10.0

- integrate `GET` and `DELETE` methods for the `/order` endpoint and add possibility to do a dry run for the `POST` method using `/order/test` endpoint
- add badges on README.md

## 0.9.0

- integrate `/order` endpoint

## 0.8.0

- integrate `/ticker/bookTicker` endpoint

## 0.7.0

- integrate `/ticker/price` endpoint
- upgrade dependencies

## 0.6.0

- integrate `/avgPrice` endpoint
- integrate `/ticker/24hr` endpoint

## 0.5.0

- integrate `/klines` endpoint

## 0.4.0

- integrate `/historicalTrades` endpoint
- integrate `/aggTrades` endpoint

## 0.3.0

- integrate `/trades` endpoint

## 0.2.1

- update package description + fix dart format so we have the last points for pub.dev score

## 0.2.0

- integrate `/depth` endpoint
- refactor get request
- added `TradingStatus` enum
- added `BinanceApiError` custom exception
- support filter by symbol when using `exchangeInfo`

## 0.1.0

- Initiate package by beginning to integrate Binance REST API. Supports 3 endpoints for now which are : `ping`, `time` and `exchangeInfo`.
