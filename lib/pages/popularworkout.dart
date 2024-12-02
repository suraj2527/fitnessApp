import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo/colorextension.dart';




class popularworkout extends StatefulWidget {
  const popularworkout({super.key});

  @override
  State<popularworkout> createState() => _popularworkoutState();
}

class _popularworkoutState extends State<popularworkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Column(
          children: [
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
                      color: TColor.sky,
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
        ],
        ),

      ),
    );
  }
}
