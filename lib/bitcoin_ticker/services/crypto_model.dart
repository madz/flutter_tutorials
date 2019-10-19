import 'package:app_brewery_tutorial/bitcoin_ticker/services/networking.dart';
import 'package:flutter/material.dart';

class CryptoModel {
  Future<dynamic> getCryptoPrice(String cryptoName, String currency) async {
    final url =
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$cryptoName$currency';

    debugPrint('url = $url');

    final NetworkHelper networkHelper = NetworkHelper(url: url);

    final weatherData = await networkHelper.getData();

    return weatherData;
  }
}
