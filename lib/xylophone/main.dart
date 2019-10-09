import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNum) {
    final player = AudioCache();
    player.play('note$soundNum.wav');
  }

  Widget buildKey(Color colorKey, int soundNum) {
    return Expanded(
      child: FlatButton(
        color: colorKey,
        onPressed: () {
          playSound(soundNum);
        },
        child: Text('Click Me $soundNum!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildKey(Colors.red.shade900, 1),
                buildKey(Colors.orange.shade900, 2),
                buildKey(Colors.yellow.shade900, 3),
                buildKey(Colors.green.shade900, 4),
                buildKey(Colors.blue.shade900, 5),
                buildKey(Colors.indigo.shade900, 6),
                buildKey(Colors.purple.shade900, 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
