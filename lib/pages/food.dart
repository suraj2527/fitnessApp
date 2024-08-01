import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo/colorextension.dart';
class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  int _selectedCardIndex = -1;


  final List<String> breakfastItems = [
    "Pancakes",
    "Waffles",
    "Omelette",
    "Toast",
    "Cereal",
    "Smoothie",
    "Yogurt",
    "Coffee"
  ];
  final List<String> images = [
    "images/fit.png",
    "images/food.png",
    "images/w1.jpg",
    "images/w2.jpg",
    "images/w3.jpg",
    "images/w4.jpg",
    "images/w5.jpg",
    "images/w6.jpg"
  ];

  final List<String> lunchItems = [
    "Burger",
    "Sandwich",
    "Salad",
    "Soup",
    "Pasta",
    "Pizza",
    "Sushi",
    "Juice"
  ];

  final List<String> dinnerItems = [
    "Steak",
    "Chicken",
    "Fish",
    "Rice",
    "Vegetables",
    "Pasta",
    "Soup",
    "Wine"
  ];

  void _onCardPressed(int index) {
    setState(() {
      _selectedCardIndex = _selectedCardIndex == index ? -1 : index;
    });
  }

  List<String> _getItemsForSelectedCard() {
    switch (_selectedCardIndex) {
      case 0:
        return breakfastItems;
      case 1:
        return lunchItems;
      case 2:
        return dinnerItems;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Menu'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFoodCard(0, "Breakfast"),
              _buildFoodCard(1, "Lunch"),
              _buildFoodCard(2, "Dinner"),
            ],
          ),
          _selectedCardIndex != -1
              ? Expanded(
            child: ListView.builder(
              itemCount: _getItemsForSelectedCard().length,
              itemBuilder: (context, index ) {
                return Container(
                  height: 70,
                  child: ListTile(
                    title: Text(_getItemsForSelectedCard()[index]),
                    // leading: Container(
                    //   height: 50,
                    //   width: 60,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(40)
                    //   ),
                    //   child: Image.asset(images[index],
                    //   ),
                    // ),
                  ),
                );
              },
            ),
          )
              : Container(),
        ],
      ),

    bottomNavigationBar: ClipRRect(
           child: Container(
    height: 60,
    decoration:
    BoxDecoration(border: Border.all(color: Colors.black38)),
    child: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: TColor.lightGray,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 1,
    items: [
    BottomNavigationBarItem(
    icon: IconButton(
    icon: Icon(CupertinoIcons.home, size: 23),
    onPressed: (){
    Navigator.pushReplacementNamed(context, '/home');
    },),
    label: "Home"),
    BottomNavigationBarItem(
    icon: IconButton(
    icon: ImageIcon(
    AssetImage("images/fit.png"),
    color: Colors.deepPurple,
    size: 30,
    ),
    onPressed: (){
    Navigator.pushReplacementNamed(context, '/training');
    },
    ),
    label: "Training"),
    BottomNavigationBarItem(
    icon: IconButton(
    icon: ImageIcon(
    AssetImage("images/food.png"),
    color: Colors.deepPurple,
    size: 30,
    ),
    onPressed: (){
    Navigator.pushReplacementNamed(context, '/food');
    },
    ),
    label: "Food"),
    BottomNavigationBarItem(
    icon: IconButton(
    icon: Icon(CupertinoIcons.person),
    color: Colors.deepPurple,
    onPressed: (){
    Navigator.pushReplacementNamed(context, '/profile');
    },
    ),
    label: "Profile"),
    ]),
    ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Theme(
    data: ThemeData(
    colorScheme:
    ColorScheme.fromSeed(seedColor: TColor.primaryColor2)),
    child: FloatingActionButton(
    onPressed: () {},
    shape: const CircleBorder(),
    child: Container(
    decoration: BoxDecoration(),
    child: const Icon(CupertinoIcons.chat_bubble),
    ),
    ),
    ));
  }

  Widget _buildFoodCard(int index, String title) {
    return GestureDetector(
      onTap: () => _onCardPressed(index),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 100,
          height: 100,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}