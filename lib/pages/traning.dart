import 'dart:convert';

import 'package:demo/SubScreens/vedio_info.dart';
import 'package:demo/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';
import 'package:get/get.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List info=[];
  _initData() async{
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      setState(() {
        info= json.decode(value);
      });


    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();

  }



  Widget _buildWorkoutCard(int index, String title) {
    return GestureDetector(

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


  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
   // ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: TColor.primaryColor1));
    return Scaffold(
      backgroundColor: TColor.lightGray,
      // appBar: AppBar(
      //   title:
      //      Text(
      //       "Training",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //
      //
      //   backgroundColor: Colors.black
      // ),
      body: Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: Width,
                  height: 60,
                  color: TColor.Title,
                  child: Row(
                    children: [
                      SizedBox(width: 1,),

                      Icon(Icons.arrow_back_ios, size: 20,
                            color: TColor.white,),
                      SizedBox(width: 15,),

                      Text("Training", style: TextStyle(
                        fontSize: 20,
                        color: TColor.white
                      ),)

                    ],
                  ),
                ),





                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Your Program",
                      style: TextStyle(
                        fontSize: 25,
                        color: TColor.Title,
                        fontWeight: FontWeight.w700,
                      ),

                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: (){
                        Get.to(() =>VedioInfo());
                      },
                      child: Text("Details",
                        style: TextStyle(
                          fontSize: 16,
                          color: TColor.sky,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Get.to(() =>VedioInfo());
                      },
                      child: Icon(Icons.arrow_forward,
                      size: 20,
                      color: TColor.sky,),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  width: Width,
                  height: 200,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        TColor.heading.withOpacity(0.9),
                        TColor.greey.withOpacity(0.41),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(100),

                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5,10),
                        blurRadius: 20,
                        color: TColor.greey.withOpacity(0.2),
                      )
                    ]
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Next Workout",
                          style: TextStyle(
                            fontSize: 14,
                            color: TColor.white,
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: 22,
                            color: TColor.white,
                          ),
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                            fontSize: 22,
                            color: TColor.white,
                          ),
                        ),
                        SizedBox(height: 31,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer_outlined,
                                  size: 20,
                                    color: TColor.white,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "60 min ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: TColor.white,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: [
                                  BoxShadow(
                                    color: TColor.heading,
                                    blurRadius: 5,
                                    offset: Offset(4,8),
                                  )
                                ]
                              ),
                              child: Icon(

                                Icons.play_circle_fill,
                                color: TColor.white,
                                size: 60,
                              ),
                            )


                          ],
                        )
                      ],
                    ),
                  ),



                ),

                SizedBox(height: 5,),
                Container(
                  height: 120,
                  width: Width,
                  child: Stack(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Container(
                          width: Width,

                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                "images/Training1.png"
                              ),
                              fit: BoxFit.fill
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                offset: Offset(8,10),
                                color: TColor.gray.withOpacity(0.3)
                              ),
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(-1,-5),
                                  color: TColor.gray.withOpacity(0.3)
                              )
                            ]
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                        width: Width,
                        margin: EdgeInsets.only(right: 180,),


                        decoration: BoxDecoration(
                            //color: TColor.heading.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/Training2.png"
                                ),
                                //fit: BoxFit.fill
                            ),

                        ),

                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,

                        margin: EdgeInsets.only(left: 150,top: 42),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "You are doing great",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: TColor.heading
                              ),
                            ),
                            SizedBox(height: 10,),
                            RichText(text: TextSpan(
                              text: "keep it up\n",
                              style: TextStyle(
                                color: TColor.greey,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: "stick to your plan"
                                )
                              ]
                            ))

                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 15,),


                Row(
                  children: [

                    Text(
                      "Area Of Focus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),

                Expanded(child: ListView.builder(
                  itemCount: (info.length.toDouble()/2).toInt(), //2
                    itemBuilder: (context,i){
                    int a=2*i;
                    int b=2*i +1;
                      return Row(
                        children: [
                          Container(
                            height: 110,
                            width: (Width-45)/2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(

                                image: AssetImage(
                                 info[a]["img"],

                                ),

                              ),

                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5,5),
                                  color: TColor.heading.withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5,-5),
                                  color: TColor.heading.withOpacity(0.1),
                                )

                              ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: TColor.heading,

                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40,),

                          Container(
                            height: 110,
                            width: 160,
                            padding: EdgeInsets.all(0.0 ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(

                                  image: AssetImage(
                                    info[b]["img"],

                                  ),

                                ),

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5,5),
                                    color: TColor.heading.withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5,-5),
                                    color: TColor.heading.withOpacity(0.1),
                                  )
                                ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: TColor.heading,

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );


                    }))




              ],
            ),
          ),








    );
  }
}


