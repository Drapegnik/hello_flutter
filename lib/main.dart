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

class MyApp extends StatelessWidget {
  final String title = 'Hello Flutter';

  _buildScrollableContent() {
    return ListView.builder(
        itemCount: 255,
        itemBuilder: (context, index) {
          print('lazy build $index');
          int c = 255 - index * 10;
          return Container(
              alignment: Alignment.center,
              color: Color.fromARGB(255, c, 255, c),
              height: 50,
              padding: const EdgeInsets.all(10),
              child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: [
                    TextSpan(
                        text: '$index: ',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    TextSpan(text: 'Long time ago '),
                    TextSpan(text: 'lorem ipsum dolor sit amet '),
                    TextSpan(
                        text: 'lorem ipsum dolor sit amet',
                        style: TextStyle(color: Colors.pink)),
                  ])));
        });
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
                      child: Scrollbar(child: _buildScrollableContent()))),
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
