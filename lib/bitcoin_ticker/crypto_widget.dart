import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoWidget extends StatefulWidget {
  const CryptoWidget({this.cryptoName, this.currency, this.price});
  final String cryptoName;
  final String currency;
  final String price;

  @override
  _CryptoWidgetState createState() => _CryptoWidgetState();
}

class _CryptoWidgetState extends State<CryptoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 ${widget.cryptoName} = ${widget.price} ${widget.currency}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
