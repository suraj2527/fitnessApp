import 'package:demo/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  int _selectedCardIndex = -1;


  final List<String> choices = [
    "Begineer",
    "Intermediate",
    "Advance",
  ];
  Widget _buildWorkoutCard(int index, String title) {
    return GestureDetector(
      onTap: () => _OnCardPressed(index),
      child: Card(
        color: TColor.greey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(

          width: 100,
          height: 100,
          child: Center(
            child: Text(title,style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }


  void _OnCardPressed(int index) {
    setState(() {
      _selectedCardIndex = _selectedCardIndex == index ? -1 : index;
    });
  }
  List<String> _getItemsForSelectedCard() {
    switch (_selectedCardIndex) {
      case 0:
        return choices;
      case 1:
        return choices;
      case 2:
        return choices;
      case 3:
        return choices;
      case 4:
        return choices;
      case 5:
        return choices;
      case 6:
        return choices;
      case 7:
        return choices;

      default:
        return ['choices'];
    }
  }

  late String dropdownValue = 'Beginner';

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primaryColor1));
    return Scaffold(
      backgroundColor: TColor.lightGray,
      appBar: AppBar(
        title: Text(
          "Training",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),

              // Text("welcome",style: TextStyle(fontSize: 16),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Workouts",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'Poppins'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                        style: TextStyle(decorationColor: TColor.gray),
                      ))
                ],
              ),
              // SizedBox(height: 1),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColor.primaryColor2,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/w1.jpg"))),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 300,
                      height: 150,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColor.primaryColor2,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/w2.jpg"))),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColor.primaryColor2,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/w3.jpg"))),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColor.primaryColor2,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/w4.jpg"))),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColor.primaryColor2,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/w5.jpg"))),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 300,
                      height: 150,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColor.primaryColor2,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/w6.jpg"))),
                      child: Center(child: Text("")),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                  height: 30,
                  child: Text(
                    "Choose Workout",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  )),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildWorkoutCard(0, "PushUp"),
                    _buildWorkoutCard(1, "PullUp"),
                    _buildWorkoutCard(2, "Dumble"),
                    _buildWorkoutCard(3, "legs"),
                    _buildWorkoutCard(4, "Chest"),
                    _buildWorkoutCard(5, "Shoulder"),
                    _buildWorkoutCard(6, "BenchPress"),
                    _buildWorkoutCard(7, "Running"),


                  ],
                ),
              ),
              _selectedCardIndex != -1
                  ? Expanded(
                child: ListView.builder(
                  itemCount: _getItemsForSelectedCard().length,
                  itemBuilder: (context, index ) {
                    return InkWell(
                      child: Container(
                        height: Height*0.1,
                        child: Card(
                          color: TColor.secondaryColor1.withOpacity(0.2),
                          child: ListTile(
                            title: Text(_getItemsForSelectedCard()[index]),

                          ),
                        ),
                      ),
                      onTap: (){},
                    );
                  },
                ),
              ): Container(),
            ],
          ),
        ),
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
                      icon: Icon(CupertinoIcons.home, size: 23,color: Colors.black,),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: ImageIcon(
                        AssetImage("images/fit.png"),
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/training');
                      },
                    ),
                    label: "Training"),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: ImageIcon(
                        AssetImage("images/food.png"),
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/food');
                      },
                    ),
                    label: "Food"),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: Icon(CupertinoIcons.person),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      },
                    ),
                    label: "Profile"),
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:

      FloatingActionButton(
        backgroundColor: TColor.greey,
        onPressed: () {},
        shape: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(),
          child: const Icon(CupertinoIcons.chat_bubble,color: Colors.white,),
        ),
      ),

    );
  }
}


