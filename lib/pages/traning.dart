import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo/SubScreens/vedio_info.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List info = [];

  // Load data from JSON
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  // Method to build workout cards
  Widget _buildWorkoutCard(int index, String title) {
    return GestureDetector(
      onTap: () {
        // Handle card tap if needed
      },
      child: Card(
        color: Colors.black, // Dark card color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 100,
          height: 100,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background theme
      appBar: AppBar(
        title: Text("Training", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black, // Dark app bar color
        elevation: 0,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 30),

        ),
      ),
      body: SingleChildScrollView( // Wrapping everything in SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Your Program",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Heading text color
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      Get.to(() => VedioInfo()); // Navigate to video info
                    },
                    child: Row(
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),

              // Section for the next workout with gradient background
              Container(
                width: Width,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.withOpacity(0.9), Colors.grey.withOpacity(0.5)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: Offset(4, 8),
                      color: Colors.grey.withOpacity(0.3),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next Workout", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 8),
                      Text(
                        "Legs Toning and Glutes Workout",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined, color: Colors.white),
                          SizedBox(width: 5),
                          Text("60 min", style: TextStyle(color: Colors.white)),
                          Spacer(),
                          Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Area of Focus Header
              Text(
                "Area Of Focus",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),

              // List of focus areas loaded from JSON
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: info.length,
                itemBuilder: (context, i) {
                  return FocusAreaCard(
                    title: info[i]["title"],
                    imagePath: info[i]["img"],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for each focus area card
class FocusAreaCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const FocusAreaCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(5, 5),
            color: Colors.purple.withOpacity(0.1),
          ),
          BoxShadow(
            blurRadius: 6,
            offset: Offset(-5, -5),
            color: Colors.purple.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
