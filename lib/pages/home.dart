import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('首页'),
          backgroundColor: Colors.transparent,
          border: Border.all(
              color: Colors.transparent, width: 0.0, style: BorderStyle.none),
        ),
        child: SafeArea(
            child: Scaffold(
          body: Text('首页内容'),
        )));
  }
}
