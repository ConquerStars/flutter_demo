import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          brightness: Brightness.light,
          middle: Text('发现', style: TextStyle(color: Colors.blueAccent)),
          backgroundColor: Colors.transparent,
          border: Border.all(
              color: Colors.transparent, width: 0.0, style: BorderStyle.none),
        ),
        child: SafeArea(
            child: Scaffold(
          body: Text('最新资讯'),
        )));
  }
}
