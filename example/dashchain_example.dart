// ignore_for_file: avoid_print

import 'package:dashchain/dashchain.dart';

void main() async {
  final binance = BinanceRestApi();
  final apiOK = await binance.checkAvailability();
  if (apiOK) {
    print('Binance REST API is up and running, let\'s go !');
  } else {
    print('Binance REST API seems to be down, please retry later.');
  }
}
