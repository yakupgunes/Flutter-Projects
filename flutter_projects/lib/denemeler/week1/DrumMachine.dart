// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(drumMachine());

class drumMachine extends StatelessWidget {
  //final url = await player.load("bongo.wav");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  AudioPlayer? player = AudioPlayer();

  void sesiCal(String ses) {
    player?.play(AssetSource("$ses.wav"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      "bongo",
                      Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      "ridebel",
                      Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      "bip",
                      Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      "woo",
                      Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      "clap1",
                      Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      "clap2",
                      Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: buildDrumPad(
                      "how",
                      Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      "oobah",
                      Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildDrumPad(String ses, Color renk) {
    return InkWell(
      child: Container(
        color: renk,
      ),
      onTap: () {
        sesiCal(ses);
      },
    );
  }
}
