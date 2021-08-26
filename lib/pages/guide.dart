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

  Timer? golbalTimer;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      golbalTimer = timer;
      setState(() {
        print('倒计时：$countDown');
        if (countDown < 1) {
          golbalTimer?.cancel();
          // Navigator.of(context).pushReplacementNamed('home');
          Navigator.pop(context);
        } else {
          countDown--;
        }
      });
    });
  }

  // 跳过
  void skip() {
    // print(golbalTimer);
    golbalTimer?.cancel();
    // Navigator.of(context).pushReplacementNamed('home');
    Navigator.pop(context);
  }

  final Color bgColor = Colors.grey.shade900;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: bgColor,
            toolbarHeight: 0,
          ),
          body: InkWell(
              child: Container(
                child: Text('喂！不得了了！！隔壁便利店的薯片半价！！'),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bgColor,
                ),
              ),
              onTap: (){
                print('一起去看看吧');
              },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: skip,
            tooltip: 'Increment',
            child: Text('跳过$countDown'),
          ),
      ),
      onWillPop: back,
    );
  }

  // 阻止返回事件
  Future<bool> back() async {
    print('阻止返回');
    return false;
  }
}
