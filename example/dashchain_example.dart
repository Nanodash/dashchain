import 'package:dashchain/dashchain.dart';
import 'package:dashchain/src/binance/constants.dart';

// ignore_for_file: avoid_print
void main() async {
  final binance = BinanceRestApi();
  final apiOK = await binance.ping();
  if (apiOK) {
    print('Binance REST API is up and running on $baseEndpoint, let\'s go !');
    await _testAPI(binance, baseEndpoint);
  } else {
    print('Binance REST API seems to be down, will try to fallback...');
    try {
      final endpointUrl = await binance.getfallbackEndpoint();
      print('Binance REST API is up and running on $endpointUrl, let\'s go !');
      await _testAPI(binance, endpointUrl);
    } catch (e) {
      print('Binance REST API is definitely down...($e)');
    }
  }
  binance.dispose();
}

Future<void> _testAPI(BinanceRestApi api, String baseEndpoint) async {
  final time = await api.checkApiTime();
  print('Binance\'s server time is $time');
}
