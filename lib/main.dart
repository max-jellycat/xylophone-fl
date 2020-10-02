import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Key {
  int sound;
  String note;
  Color color;

  Key(this.sound, this.note, this.color);
}

List<Key> keys = [
  Key(1, "C", Colors.red),
  Key(2, "D", Colors.orange),
  Key(3, "E", Colors.yellow),
  Key(4, "F", Colors.green),
  Key(5, "G", Colors.teal),
  Key(6, "A", Colors.blue),
  Key(7, "B", Colors.purple),
];

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: XylyphonePage(),
        ),
      ),
    ),
  );
}

void audioPlayerHandler(AudioPlayerState value) => print('state => $value');

class SoundController {
  static AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache audioCache = AudioCache();

  static void play(int sound) {
    if (Platform.isIOS) {
      audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
    }
    audioCache.play('note$sound.wav');
  }
}

class XylyphonePage extends StatefulWidget {
  @override
  _XylyphonePageState createState() => _XylyphonePageState();
}

class _XylyphonePageState extends State<XylyphonePage> {
  Widget buildKey(int sound, String note, Color color) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () => SoundController.play(sound),
        child: Text(
          note,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (var key in keys) buildKey(key.sound, key.note, key.color)
      ],
    );
  }
}
