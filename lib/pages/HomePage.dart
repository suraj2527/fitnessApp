import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Hello ABC",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("My Plan",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
            SizedBox(height: 35,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(

                  height: 120,
                  width: 140,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Workout Details",style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
                    onPressed: (){},),
                ),
                SizedBox(

                  height: 120,
                  width: 140,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Medidate Time",style: TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.center,),
                    onPressed: (){},),
                ),

              ],),

            SizedBox(height: 35,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(

                  height: 120,
                  width: 140,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Calories Burn",style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
                    onPressed: (){},),
                ),
                SizedBox(

                  height: 120,
                  width: 140,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Let's Go",style: TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.center,),
                    onPressed: (){},),
                ),

              ],),
            SizedBox(height: 20,),
            Text("Weekly Status:",style:
            TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

          ],
        ),
      )),
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
}