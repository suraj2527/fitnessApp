import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';
class foodTile extends StatelessWidget {
  const foodTile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
             Text(
                'Food',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Breakfast'),
              Tab(text: 'Lunch'),
              Tab(text: 'Dinner'),

            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            buildTabContent(screenWidth, screenHeight),
            buildTabContent(screenWidth, screenHeight),
            buildTabContent(screenWidth, screenHeight),

          ],
        ),
      ),
    );
  }

  Widget buildTabContent(double screenWidth, double screenHeight) {
    final List<String> images = [
      "images/B1.jpg",
      "images/B2.jpg",
      "images/B3.jpg",
      "images/B4.jpg",
      "images/B5.jpg",
      "images/B6.jpeg",
      "images/B7.jpeg",
      "images/B8.jpeg",
      "images/B9.jpeg",
      "images/B10.jpeg",
      "images/B11.jpeg",

    ];

    final List<String> items = [
      '''Multigrain Roti And
Mushroom Matar
Paneer Curry''',
      '''Quinoa  Vegetable
Khichdi,Shahi Paneer,Vegetable
 Salad.''',
      '''Bajra Roti With
Masoor Dal And
Cabbage Sabzi''',
      '''Bhindi Masala With
Brown Rice And
Cucumber Raita''',
      '''Brown Rice With
Channa Masala
And Spinach Salad''',
      '''Broiled Fish, Brown
Rice, Mixed Green
Salad''',
      '''Palak Paneer Multigrain
Roti Lauki Raita ''',
      '''Tofu Curry,  Whole
Wheat Roti, Sprouts
Salad''',
      '''Stuffed Baked
Mushroom,
Green Salad''',
      '''Multigrain Millet 
Vegetable Khichdi
And Curd''',
      '''Namkeen Chawal
with Spoonful Of
Curd'''
    ];

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index ) {
                  return Card(
                    elevation: 1,
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                TColor.primaryColor1.withOpacity(0.11119),
                                TColor.primaryColor2.withOpacity(0.25),
                              ]
                          )
                      ),
                      height: screenHeight*0.125,
                      child: ListTile(
                        title: Text(items[index]),
                        trailing: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Image.asset(images[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}