import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 100,
                child: Text("1.container"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.orange,
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                color: Color.fromARGB(255, 240, 2, 82),
                child: Text("2.container"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
