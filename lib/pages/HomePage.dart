import 'package:demo/pages/traning.dart';
import 'package:demo/pages/yoga.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';

import 'bottom_navbar.dart';
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
        backgroundColor: Colors.black,
        title: Text("Hello ABC",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("Popular Plan",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
            SizedBox(height: 35,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(

                  height: 120,
                  width: 150,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[700],

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Popular Workout",style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
                    onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Training()));
                    },),
                ),
                SizedBox(

                  height: 120,
                  width: 150,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[700],

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Popular Yoga",style: TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.center,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> YogaScreen()));
                    },),
                ),

              ],),

            SizedBox(height: 35,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(

                  height: 80,
                  width: 340,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[700],

                    borderRadius: BorderRadius.circular(8),
                    child: Text("Let's Go...",style: TextStyle(color: Colors.white,fontSize: 18,)),
                    onPressed: (){},),
                ),

              ],),
            SizedBox(height: 20,),
            Text("Weekly Status:",style:
            TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            //DashbaordWidget(),
          ],
        ),

      )),

    );
  }
}