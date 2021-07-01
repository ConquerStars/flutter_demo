import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ios_style/pages/themeSelect.dart';

class Mine extends StatelessWidget {
  BuildContext parentCtx;
  Mine(this.parentCtx);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          brightness: Brightness.light,
          middle: Text('个人中心', style: TextStyle(color: Colors.blueAccent)),
          backgroundColor: Colors.transparent,
          border: Border.all(
              color: Colors.transparent, width: 0.0, style: BorderStyle.none),
        ),
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
                    leading: Icon(Icons.edit_attributes),
                    title: Text('主题设置'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => ThemeSelect()));
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
