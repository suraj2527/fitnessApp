import 'package:demo/pages/HomePage.dart';
import 'package:demo/pages/food.dart';
import 'package:demo/pages/profile.dart';
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
    foodTile(),
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

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon:  Icon(CupertinoIcons.home, size: 25,color: Colors.black,),

           label: 'Home',

          ),

          BottomNavigationBarItem(
            icon: ImageIcon(
            AssetImage("images/fit.png"),
    color: Colors.black,
    size: 30,
    ),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon:ImageIcon(
              AssetImage("images/food.png"),
              color: Colors.black,
              size: 30,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
    icon:  Icon(CupertinoIcons.person, size: 25,color: Colors.black,),


            label: 'Profile',
          ),
        ],
      ),
    );
  }
}