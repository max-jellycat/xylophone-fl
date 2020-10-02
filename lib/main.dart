import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

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

  static void play(String sound) {
    if (Platform.isIOS) {
      audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
    }
    audioCache.play(sound);
  }
}

class XylyphonePage extends StatefulWidget {
  @override
  _XylyphonePageState createState() => _XylyphonePageState();
}

class _XylyphonePageState extends State<XylyphonePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Colors.red,
            onPressed: () => SoundController.play('note1.wav'),
            child: null,
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.orange,
            onPressed: () => SoundController.play('note2.wav'),
            child: null,
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.yellow,
            onPressed: () => SoundController.play('note3.wav'),
            child: null,
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.green,
            onPressed: () => SoundController.play('note4.wav'),
            child: null,
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.teal,
            onPressed: () => SoundController.play('note5.wav'),
            child: null,
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.blue,
            onPressed: () => SoundController.play('note6.wav'),
            child: null,
          ),
        ),
        Expanded(
          child: FlatButton(
            color: Colors.purple,
            onPressed: () => SoundController.play('note7.wav'),
            child: null,
          ),
        ),
      ],
    );
  }
}
