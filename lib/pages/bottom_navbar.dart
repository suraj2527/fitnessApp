import 'package:demo/pages/HomePage.dart';
import 'package:demo/pages/food.dart';
import 'package:demo/pages/profile.dart';
import 'package:demo/pages/yoga.dart';
import 'package:demo/pages/traning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashbaordWidget extends StatefulWidget {
  @override
  _DashbaordWidgetState createState() => _DashbaordWidgetState();
}

class _DashbaordWidgetState extends State<DashbaordWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Training(),
    FoodTile(),
    Profile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for the entire screen
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white, // Selected item color in white
        unselectedItemColor: Colors.grey[600], // Unselected item color in grey
        backgroundColor: Colors.black, // Dark background for the navigation bar
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // Keeps the items evenly spaced
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              size: 25,
              color: _currentIndex == 0 ? Colors.white : Colors.grey[600], // Icon color change based on selection
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/fit.png"),
              color: _currentIndex == 1 ? Colors.white : Colors.grey[600],
              size: 30,
            ),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/food.png"),
              color: _currentIndex == 2 ? Colors.white : Colors.grey[600],
              size: 30,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              size: 25,
              color: _currentIndex == 3 ? Colors.white : Colors.grey[600],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
