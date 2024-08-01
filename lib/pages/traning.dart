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
  late String dropdownValue = 'Beginner';

  @override
  Widget build(BuildContext context) {
    ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primaryColor1));
    return Scaffold(
      backgroundColor: TColor.lightGray,
      appBar: AppBar(
        title: Text(
          "Training",
          style: TextStyle(),
        ),
        backgroundColor: TColor.primaryColor1,
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
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColor.primaryColor2,
                      ),
                      child: TextButton(
                        child: Text(""),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColor.primaryColor2,
                      ),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColor.primaryColor2,
                      ),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColor.primaryColor2,
                      ),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColor.primaryColor2,
                      ),
                      child: Center(child: Text("")),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColor.primaryColor2,
                      ),
                      child: Center(child: Text("")),
                    )
                  ],
                ),
              ),
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
      ),
    );
  }
}
