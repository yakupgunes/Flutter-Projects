// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_projects/denemeler/week1/TestData.dart';
import 'TestApp_const.dart';

//void main() => runApp( TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> buttons = [];

  TestData test_1 = TestData();

  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Tebrikler!", style: TextStyle(fontSize: 20.0)),
            content:
                Text("Testi Bitirdiniz.", style: TextStyle(fontSize: 20.0)),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              InkWell(
                child: Text("Başa Dön", style: TextStyle(fontSize: 20.0)),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testiSifirla();
                    buttons = [];
                  });
                },
              )
            ],
          );
        },
      );
    } else {
      setState(
        () {
          test_1.getSoruYaniti() == secilenButon
              ? buttons.add(dogruIconu)
              : buttons.add(yanlisIconu);
          test_1.sonrakiSoru();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          children: buttons,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red[400],
                          disabledForegroundColor: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.thumb_down, size: 30.0),
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green[400],
                          disabledForegroundColor: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.thumb_up, size: 30.0),
                      ),
                      onPressed: () {
                        butonFonksiyonu(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
