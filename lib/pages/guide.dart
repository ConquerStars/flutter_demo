import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class Guide extends StatefulWidget {
  Guide({Key? key}) : super(key: key);

  @override
  _Guide createState() => _Guide();
}

class _Guide extends State<Guide> {
  int countDown = 5;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        print('倒计时：$countDown');
        if (countDown < 1) {
          timer.cancel();
          Navigator.pop(context);
        } else {
          countDown--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(children: <Widget>[
        Text('广告位招租'),
        FloatingActionButton(
          child: Text('跳过$countDown'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]),
      onWillPop: back,
    );
  }

  // 阻止返回事件
  Future<bool> back() async {
    print('阻止返回');
    return false;
  }
}
