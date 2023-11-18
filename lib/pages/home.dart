import 'package:flutter/cupertino.dart';
import 'package:cathay/components/home_components/option1.dart';
import 'package:cathay/components/home_components/option2.dart';
import 'package:cathay/components/home_components/option3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Option1(),
    Option2(),
    Option3(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final desiredPage = ModalRoute.of(context)!.settings.arguments as int?;
      setState(() {
        _selectedIndex = desiredPage ?? 0;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home Page'),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return CupertinoTabBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          label: 'Option 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Option 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.text_badge_checkmark),
          label: 'Option 3',
        ),
      ],
    );
  }
}
