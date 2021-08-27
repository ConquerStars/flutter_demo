import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ios_style/components/ios_nav_bar.dart';
import 'package:ios_style/pages/themeSelect.dart';

import 'package:ios_style/utils/custom_router.dart';

class Mine extends StatelessWidget {
  var parentCtx;
  Mine(this.parentCtx);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: IosNavBar('个人中心'),
        child: SafeArea(
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      child: Text('个人信息占位'),
                      padding: EdgeInsets.fromLTRB(20, 40, 20 ,40),
                    )
                  ),
                  ListTile(
                    tileColor: Colors.white12,
                    leading: Icon(Icons.drafts),
                    title: Text('主题设置'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.push(this.parentCtx, CustomRoute(ThemeSelect()));
                    },
                  ),
                  ListTile(
                    tileColor: Colors.white12,
                    leading: Icon(Icons.settings),
                    title: Text('其他设置'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
        )));
  }
}
