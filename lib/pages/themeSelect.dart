import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ios_style/components/ios_nav_bar.dart';

class ThemeSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: IosNavBar('选择主题'),
        child: SafeArea(
            child: Scaffold(
          body: Text('跟随系统？'),
        )));
  }
}
