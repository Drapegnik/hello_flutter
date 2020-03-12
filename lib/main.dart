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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Square(color: Colors.red),
                          Square(color: Colors.blue),
                          Square(color: Colors.black),
                        ],
                      ))),
              Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.green,
                      constraints: BoxConstraints.expand()))
            ])));
  }
}
