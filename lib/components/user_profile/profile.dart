
import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('New Page'),
      ),
      child: Center(
        child: Text('This is the new page'),
      ),
    );
  }
}