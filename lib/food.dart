import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                    leading: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Image.asset(images[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
              : Container(),
        ],
      ),
    );
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