import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const double _kNavBarPersistentHeight = kMinInteractiveDimensionCupertino;

class IosNavBar extends StatelessWidget implements ObstructingPreferredSizeWidget{
  
  const IosNavBar(
    this.data, {
    Key? key,
    this.backgroundColor
  }) : super(key: key);

  final String data;
  final Colors? backgroundColor;
  
  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(_kNavBarPersistentHeight);
  }
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
            brightness: Brightness.light,
            middle: Text(this.data, style: TextStyle(color: Colors.blueAccent)),
            backgroundColor: Colors.transparent,
            border: Border.all(
              color: Colors.transparent, width: 0.0, style: BorderStyle.none
            ),
          );
  }
}
