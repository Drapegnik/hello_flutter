// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Square extends StatelessWidget {
  final Color color;

  const Square({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 50,
      height: 50,
    );
  }
}

// Square(color: Colors.red),
//         Square(color: Colors.blue),
//         Square(color: Colors.black),

class MyApp extends StatelessWidget {
  final String title = 'Hello Flutter';

  _buildScrollableContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(26, (index) {
        int c = 255 - index * 10;
        return Container(color: Color.fromARGB(255, c, c, c), height: 50);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Column(children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Container(
                      color: Colors.white,
                      constraints: BoxConstraints.expand(),
                      child: Scrollbar(
                          child: SingleChildScrollView(
                              child: _buildScrollableContent())))),
              Expanded(
                  flex: 1,
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    Container(
                        color: Colors.green,
                        constraints: BoxConstraints.expand()),
                    IndexedStack(index: 1, children: [
                      Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Square(color: Colors.red)),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Square(color: Colors.blue)),
                    ]),
                    Align(
                        child: Square(color: Colors.black),
                        alignment: Alignment.topLeft)
                  ]))
            ])));
  }
}
