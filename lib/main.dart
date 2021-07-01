import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ios_style/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 页面
import 'package:ios_style/pages/home.dart';
import 'package:ios_style/pages/guide.dart';
import 'package:ios_style/pages/news.dart';
import 'package:ios_style/pages/mine.dart';
import 'package:ios_style/pages/themeSelect.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    // systemNavigationBarColor: Color(0xFF000000),
    // systemNavigationBarDividerColor: null,
    statusBarColor: Colors.transparent,
    // systemNavigationBarIconBrightness: Brightness.light,
    // statusBarIconBrightness: Brightness.dark,
    // statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

var appCtx;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appCtx = context;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(), // dark
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        'guide': (BuildContext context) => Guide()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  DateTime lastPopTime = DateTime.now().subtract(Duration(seconds: 2));

  @override
  void initState() {
    super.initState();
    getPrefs(context); // 获取本地配置信息
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: CupertinoColors.activeBlue,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: '主页',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.eye),
                label: '发现',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.folder),
                label: '我的',
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(builder: (BuildContext context) {
              print(index);
              if (index == 0) {
                return HomePage();
              } else if (index == 1) {
                return News();
              } else {
                return Mine(appCtx);
              }
            });
          },
        ),
      ),
      onWillPop: quit,
    );
  }

  // 返回确认退出 App
  Future<bool> quit() async {
    if (DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
      lastPopTime = DateTime.now();
      Toast.show('再按一次退出', context);
    } else {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    return false;
  }

  Future getPrefs(BuildContext context) async {
    // 获取本地配置信息
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool readedGuide = prefs.getBool('readed_guide') ?? false; // 获取是否 已读导航页
    bool readedStartAdds = prefs.getBool('readed_start_adds') ?? false; // 启动页广告是否有更新
    print('是否已读导航页1: $readedGuide');
    print('启动页广告是否有更新1: $readedStartAdds');
    await prefs.setBool('readed_guide', true);
    await prefs.setBool('readed_start_adds', true);
    readedGuide = prefs.getBool('readed_guide') ?? false;
    readedStartAdds = prefs.getBool('readed_start_adds') ?? false;
    print('是否已读导航页2: $readedGuide');
    print('启动页广告是否有更新2: $readedStartAdds');
    if (!readedGuide) {
      Navigator.of(context).pushNamed('guide');
    }
  }
}
