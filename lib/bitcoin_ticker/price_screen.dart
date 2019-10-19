import 'dart:io' show Platform;

import 'package:app_brewery_tutorial/bitcoin_ticker/coin_data.dart';
import 'package:app_brewery_tutorial/bitcoin_ticker/crypto_widget.dart';
import 'package:app_brewery_tutorial/bitcoin_ticker/services/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CryptoModel cryptoModel = CryptoModel();
  String selectedCurrency = 'USD';

  double btcCryptoPrice = 0.0;
  double ethCryptoPrice = 0.0;
  double ltcCryptoPrice = 0.0;

  String btcCrypto = 'BTC';
  String ethCrypto = 'ETH';
  String ltcCrypto = 'LTC';

  bool isWaiting = false;

  Widget androidDropdownButton() {
    final List<DropdownMenuItem<String>> dropDownItems = [];
    for (final String currency in currenciesList) {
      final dropDownMenuItem = DropdownMenuItem(
        value: '$currency',
        child: Text('$currency'),
      );
      dropDownItems.add(dropDownMenuItem);
    }

    return DropdownButton(
      value: '$selectedCurrency',
      items: dropDownItems,
      onChanged: (String newValue) {
        setState(() {
          selectedCurrency = newValue;
          debugPrint('selectedCurrency = $selectedCurrency');

          updateUI();
        });
      },
    );
  }

  Widget iOSPicker() {
    final List<Text> dropDownItems = [];
    for (final String currency in currenciesList) {
      final item = Text('$currency');
      dropDownItems.add(item);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        final String newValue = currenciesList[selectedIndex];
        setState(() {
          selectedCurrency = newValue;
          debugPrint('selectedCurrency = $selectedCurrency');

          updateUI();
        });
      },
      children: dropDownItems,
    );
  }

  Future updateUI() async {
    isWaiting = true;

    try {
      final btcCryptoData =
          await cryptoModel.getCryptoPrice(btcCrypto, selectedCurrency);

      final ethCryptoData =
          await cryptoModel.getCryptoPrice(ethCrypto, selectedCurrency);

      final ltcCryptoData =
          await cryptoModel.getCryptoPrice(ltcCrypto, selectedCurrency);

      isWaiting = false;

      setState(() {
        btcCryptoPrice =
            btcCryptoData == null ? 0.0 : btcCryptoData['last'] as double;

        ethCryptoPrice =
            ethCryptoData == null ? 0.0 : ethCryptoData['last'] as double;

        ltcCryptoPrice =
            ltcCryptoData == null ? 0.0 : ltcCryptoData['last'] as double;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoWidget(
            cryptoName: btcCrypto,
            currency: '$selectedCurrency',
            price: isWaiting ? '?' : '$btcCryptoPrice',
          ),
          CryptoWidget(
            cryptoName: ethCrypto,
            currency: '$selectedCurrency',
            price: isWaiting ? '?' : '$ethCryptoPrice',
          ),
          CryptoWidget(
            cryptoName: ltcCrypto,
            currency: '$selectedCurrency',
            price: isWaiting ? '?' : '$ltcCryptoPrice',
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
