import 'package:cathay/backend/openai.dart';
import 'package:cathay/components/user_profile/profile.dart';
import 'package:cathay/pages/chat_ai.dart';
import 'package:cathay/pages/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:cathay/components/home_components/survey_page.dart';
import 'package:cathay/components/home_components/country_rank.dart';
import 'package:cathay/components/home_components/option3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ReportPage(),
    Option2(),
    ChatApp()
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
        leading: Container(), // Your existing leading widget
        middle: const Text('Page Title'), // Title
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.profile_circled,
            color: Color(0xFF00645A),
            size: 35,
          ), // Replace with your desired icon
          onPressed: () {
            // Action to perform on button press
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      Profile()), // Replace with your target widget
            );
          },
        ),
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
          icon: Icon(
            CupertinoIcons.book,
            color: Color(0xFF00645A),
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.search,
            color: Color(0xFF00645A),
          ),
          label: 'Recommendations',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.chat_bubble,
            color: Color(0xFF00645A),
          ),
          label: 'Chatbot',
        ),
      ],
    );
  }

  String _getTitleForSelectedIndex(int index) {
    switch (index) {
      case 0:
        return 'Plan';
      case 1:
        return 'Option 2';
      case 2:
        return 'Option 3';
      default:
        return 'Home';
    }
  }
}
