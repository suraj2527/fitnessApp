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
    '''Spinach Moong Dal
Cheela With Protein
Shake + Papaya''',
    '''Overnight Oats Berries
Breakfast Bowl  +
1 Seasonal Fruit''',
    '''Scrambled Egg
Spread On Toast,
Protein Shake''',
    '''Almond/Soy Milk
+ Avocado Toast''',
    '''Boiled  Eggs  with
Steamed vegetables''',
    '''Raw Paneer Patty
Sandwich In Whole
Grain Bread, Fruits''',
    '''Apple Peanut Butter
Smoothie With Whey
Protein''',
    '''Bowl Of Dal Khichdi
Accompanied With
Spoonful Of Curd''',
    '''A Protein-Packed 
Smoothie With 
Banana ''',
    '''Poha Topped With
Lots Of Veggies With
Spoonful Of Curd''',
    '''Whole-Grain Toast
Spread With Peanut
Butter''',
  ];
  final List<String> images = [
    "images/B1.jpg",
    "images/B2.jpg",
    "images/B3.jpg",
    "images/B4.jpg",
    "images/B5.jpg",
    "images/B6.jpeg",
    "images/B7.jpeg",
    "images/B8.jpeg",
    "images/B9.jpeg",
    "images/B10.jpeg",
    "images/B11.jpeg",

  ];

  final List<String> lunchItems = [
    '''Paneer And Mixed
Vegetable Sabzi
With Roti''',
    '''Rajma Curry With
Brown Rice''',
    '''Soya Chunks  And
Vegetable Biryani
With Raita''',
    '''Jeera Rice With
Dal Tadka''',
    '''Brown Rice, Lauki Chana
Dal, Anda Curry
And Chana Salad''',
    '''Grilled Chicken With
White Bean & Tomato
Salad''',
    '''Lean Chicken Burger
With Lettuce, Tomato
And Beans''',
    '''Lemon Gravy Chicken,
Brown Rice, Greek
Yoghurt''',
    '''Whole Wheat Chicken
Pasta White Beans
And Green Salad''',
    '''Multigrain Chapati,
Egg Bhuji, Cucumber
Raita, Sauteed Vegetable''',
    '''Mutton Curry With
Roti And a Side of
Beetroot Salad'''
  ];

  final List<String> dinnerItems = [
    '''Multigrain Roti And
Mushroom Matar
Paneer Curry''',
    '''Quinoa  Vegetable
Khichdi,Shahi Paneer,
Vegetable Salad.''',
    '''Bajra Roti With
Masoor Dal And
Cabbage Sabzi''',
    '''Bhindi Masala With
Brown Rice And
Cucumber Raita''',
    '''Brown Rice With
Channa Masala
And Spinach Salad''',
    '''Broiled Fish, Brown
Rice, Mixed Green
Salad''',
    '''Palak Paneer Multigrain
Roti Lauki Raita And
Mango Salad''',
    '''Tofu Curry,  Whole
Wheat Roti, Sprouts
Salad''',
    '''Stuffed Baked
Mushroom,
Green Salad''',
    '''Multigrain Millet 
Vegetable Khichdi
And Curd''',
    '''Namkeen Chawal
with Spoonful Of
Curd'''
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
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: TColor.primaryColor1,
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: _getItemsForSelectedCard().length,
                itemBuilder: (context, index ) {
                  return Card(
                    elevation: 1,
                    child: Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                TColor.primaryColor1.withOpacity(0.11119),
                                TColor.primaryColor2.withOpacity(0.25),
                              ]
                          )
                      ),
                      height: Height*0.125,
                      child: ListTile(
                        title: Text(_getItemsForSelectedCard()[index]),
                        trailing: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Image.asset(images[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => _onCardPressed(index),
      child: Card(color: Colors.grey[350],
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(

          width: Width*0.3,
          height: Height*0.1,
          child: Center(
            child: Text(title),
            )
          ),
        ),
      );

  }
}