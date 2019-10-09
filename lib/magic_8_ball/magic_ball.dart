import 'dart:math';

import 'package:flutter/material.dart';

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNum = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {
              debugPrint('FlatButton 1');
              randomBall();
            },
            child: Image.asset('images/ball$ballNum.png'),
          ),
        ),
      ],
    );
  }

  void randomBall() {
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
  }
}
