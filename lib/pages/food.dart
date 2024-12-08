import 'package:flutter/material.dart';
import 'package:demo/colorextension.dart';  // Assuming this is your custom color extension file

class FoodTile extends StatelessWidget {
  const FoodTile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black, // Dark background for the whole scaffold
        appBar: AppBar(
          title: Center(
            child: Text(
              'Food',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black, // Dark background for AppBar
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Breakfast'),
              Tab(text: 'Lunch'),
              Tab(text: 'Dinner'),
            ],
            labelColor: Colors.white, // Active tab text color
            unselectedLabelColor: Colors.grey, // Inactive tab text color
            indicatorColor: Colors.white, // Tab indicator color
          ),
        ),
        body: TabBarView(
          children: [
            buildTabContent(screenWidth, screenHeight), // Correctly call the method
            buildTabContent(screenWidth, screenHeight),
            buildTabContent(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  // The buildTabContent method should be within the same class as FoodTile
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
Khichdi,Shahi Paneer,
Vegetable Salad.''',
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
Roti Lauki Raita And
Mango Salad''',
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
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(0.1), // Dark gray background
                            Colors.black.withOpacity(0.25), // Darker shade for gradient
                          ],
                        ),
                      ),
                      height: screenHeight * 0.15,
                      child: ListTile(
                        title: Text(
                          items[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white, // White text for dark theme
                          ),
                        ),
                        trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            images[index],
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
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
