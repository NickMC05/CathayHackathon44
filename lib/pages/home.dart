import 'package:cathay/components/home_components/option1.dart';
import 'package:cathay/components/home_components/option2.dart';
import 'package:cathay/components/home_components/option3.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() =>
      HomePageState();
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
      final desiredPage =
        ModalRoute.of(context)!.settings.arguments as int?;
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

 
    Color? iconColor = Theme.of(context).iconTheme.color; // Get the current theme's icon color

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent[700],
        unselectedItemColor: iconColor,
        showSelectedLabels: true,  // Show label when item is selected
        showUnselectedLabels: true,  // Show label even when item is NOT selected
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Option 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Option 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grading_outlined),
            label: 'Option 3',
          ),
        ],
      ),
    );
  }
}
