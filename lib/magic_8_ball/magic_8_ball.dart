import 'package:flutter/material.dart';

import 'magic_ball.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: const Text('Ask me anything!'),
            backgroundColor: Colors.blueGrey,
          ),
          body: MagicBall(),
        ),
      ),
    );
