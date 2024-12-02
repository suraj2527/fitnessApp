import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VedioInfo extends StatefulWidget {





  const VedioInfo({super.key});

  @override
  State<VedioInfo> createState() => _VedioInfoState();
}

class _VedioInfoState extends State<VedioInfo> {
  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;


    return Scaffold(


      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              TColor.greey.withOpacity(0.9),
              TColor.gray.withOpacity(0.9)
            ],
                begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
          )
        ),
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
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios,size: 20,
                color: TColor.white,),
            ),
                    Expanded(child: Container()),
                    Icon(Icons.info_outline,size: 20,
                      color: TColor.white,),
                    SizedBox(width: 10,),


                  ],
                ),
        ),

            Container(


              padding: EdgeInsets.all(19),
              width: Width,
              height: 185,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

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
                  SizedBox(height: 55,),
                  Row(
                    children: [
                      Container(

                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              TColor.gray.withOpacity(0.7),
                              TColor.greey.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.topCenter
                          )
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.timer,size: 20,color: TColor.white,),
                            SizedBox(width: 5,),
                            Text("60 min ", style: TextStyle(
                              fontSize: 16,
                              color: TColor.white
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(width: 11,),
                      Container(

                        width: 220,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                TColor.gray.withOpacity(0.7),
                                TColor.greey.withOpacity(0.7),
                              ],
                                begin: Alignment.topCenter,
                                end: Alignment.topCenter
                            )
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.handyman_outlined,size: 20,color: TColor.white,),
                            SizedBox(width: 5,),
                            Text("Resistent band, kettebell ", style: TextStyle(
                                fontSize: 16,
                                color: TColor.white
                            ),)
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(width: 20,),




                ],
              ),

            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: TColor.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70)
                ),
              ),
              child:Column(
                children: [
                  SizedBox(height: 18,),
                  Row(
                    children: [
                      SizedBox(width: 17,),
                      Text("Cicuit 1: Legs Toning ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: TColor.Title
                      ),),
                      SizedBox(width: 52,),
                      Row(
                        children: [
                          Icon(Icons.loop, size: 22,color: TColor.sky,),
                          SizedBox(width: 6,),
                          Text("3 Sets",
                          style: TextStyle(
                            fontSize: 15,
                            color: TColor.heading,
                          ),)
                        ],
                      ),
                      SizedBox(width: 20,),

                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),

    );
  }
}
