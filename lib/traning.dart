import 'package:demo/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: TColor.lightGray,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 1,
              iconSize: 26,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: CupertinoButton(
                    child: ImageIcon(
                      AssetImage("images/fit.png"),
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                  label: "Training",
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("images/food.png"),
                      size: 35,
                    ),
                    label: "Food"),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      icon: Icon(
                        CupertinoIcons.person,
                        size: 25,
                      ),
                    ),
                    label: "Profile")
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: TColor.primaryColor2)),
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
