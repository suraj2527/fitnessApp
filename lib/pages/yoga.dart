import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo/colorextension.dart';

class YogaScreen extends StatefulWidget {




  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  


 



  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Popular Yoga',style: TextStyle(color: Colors.white),),
      ),
      body: Expanded(
        child: ListView.builder(
          
          itemCount: 13,
          itemBuilder: (context, index){
        
            final List<String> yoga = [
              "Sukhasana",
              "Chakrasana",
              "Halasan Aasan",
              "Gomukhasana",
              "Bhramari-Pranayama",
              "Savasana",
              "Adho Mukha Svanasana",
              "Garudasana",
              "Dandasana",
              "Sirsasana",
              "Danurasana",
              "Bhujangasana",
              "Pawanmuktasana",



            ];
            final List<String> images = [
              "images/Y1.jpeg",
              "images/Y2.jpeg",
              "images/Y3.jpeg",
              "images/Y4.jpeg",
              "images/Y5.jpeg",
              "images/Y6.png",
              "images/Y7.jpeg",
              "images/Y8.jpeg",
              "images/Y9.png",
              "images/Y10.png",
              "images/Y11.jpeg",
              "images/Y12.jpeg",
              "images/Y13.png",

        
            ];
            return Column(
              children: [
                Card(color: Colors.white,
                  child: ListTile(
                    title: Text(yoga[index]),
                    trailing: Image.asset(images[index]),
                  ),
                )
              ],
            );
        
          }
        ),
      ),

    );
  }
}
