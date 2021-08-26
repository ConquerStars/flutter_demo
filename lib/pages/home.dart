import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ios_style/components/ios_nav_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: IosNavBar('首页'),
      child: SafeArea(
          child: Scaffold(
          body: Text('首页 container'),
        )
      )
    );
  }
}
