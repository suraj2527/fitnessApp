import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VedioInfo extends StatefulWidget {






  const VedioInfo({super.key});

  @override
  State<VedioInfo> createState() => _VedioInfoState();
}

class _VedioInfoState extends State<VedioInfo> {
  List vedioinfo=[];
  bool _playArea=false;
  late VideoPlayerController _controller;
  _initData() async{
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        vedioinfo= json.decode(value);
      });


    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();

  }
  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;


    return Scaffold(


      body: Container(
        decoration: _playArea==false?BoxDecoration(
          gradient: LinearGradient(
            colors:[
              TColor.greey.withOpacity(0.9),
              TColor.gray.withOpacity(0.9)
            ],
                begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
          )
        ):BoxDecoration(
        color: TColor.greey
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

            _playArea==false?Container(


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

            ):Container(
              //width: Width,
              //height: Height*0.25,
              //color: TColor.greey,
              child:  _playView(context) ,

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
                      //SizedBox(width: 20,),

                    ],
                  ),
                  
                  Expanded(child: _listview() ),
                ],
              ),
            ))
          ],
        ),
      ),);
  }

   Widget _playView(BuildContext context){
    final controller =_controller;
    if(controller!=null&&controller.value.isInitialized){
      //var Width = MediaQuery.of(context).size.width;
      //var Height = MediaQuery.of(context).size.height;
     return AspectRatio(
       aspectRatio: 16/9,
       //color: TColor.greey,

       child: VideoPlayer(controller),
     );
    }else{
      return AspectRatio(
        aspectRatio: 16/9,
          child: Center(
              child: Text("Preparing...",
              style: TextStyle(
                fontSize: 20,
                color: TColor.white
              ),
              )));

    }
  }
  _onTapVideo(int index){
    final controller = VideoPlayerController.network(vedioinfo[index]["videoUrl"]);
    _controller=controller;
    setState(() {
    });
    controller..initialize().then((_){
    controller.play();
    setState(() {

    });
    });


  }
  _listview(){
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
        itemCount: vedioinfo.length ,
        itemBuilder: (_, int index){

          return GestureDetector(
              onTap: (){
                _onTapVideo(index);
                debugPrint(index.toString());
                setState(() {
                 if (_playArea==false){
                   _playArea=true;
                 }
                });
              },
              child: _buildCard(index)

          );
        });
  }
  _buildCard(int index){
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Container(
      height: Height*0.15,
      //color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Width*0.3,
                height: Height*0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            vedioinfo[index]["thumbnail"]
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vedioinfo[index]["title"],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  //SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(
                      vedioinfo[index]["time"],
                      style: TextStyle(
                          color: TColor.gray
                      ),
                    ),
                  )

                ],
              )

            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: Width*0.3,
                height: Height*0.02,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '''15 Sec Rest''',
                    style: TextStyle(
                        color: TColor.greey,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i=0;i<55;i++)

                    i.isEven?Container(
                      width: Width*0.009,
                      height: Height*0.004,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ):Container(
                      width: Width*0.009,
                      height: Height*0.004,
                      color: Colors.white,

                    )
                ],

              )

            ],
          )

        ],
      ),
    );
  }


}
