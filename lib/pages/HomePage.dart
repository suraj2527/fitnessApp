import 'package:flutter/material.dart';
import 'package:demo/pages/traning.dart';
import 'package:demo/pages/yoga.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,  // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.grey[900],  // Dark grey for AppBar
        title: Text(
          "Hello ABC",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap the entire body in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Popular Plan Section
                Text(
                  "Popular Plan",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),

                // Row for Popular Plan Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCardButton(
                      title: "Popular Workout",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Training()),
                        );
                      },
                    ),
                    CustomCardButton(
                      title: "Popular Yoga",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YogaScreen()),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // "Let's Go" Button Section
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,  // Soft blue-grey color for the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Let's Go...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Weekly Status Section
                Text(
                  "Weekly Status:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),

                // Bar chart displaying Weekly Status
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],  // Slightly lighter dark background for chart area
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            axisNameWidget: Container(),
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Container(),
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                String title;
                                switch (value.toInt()) {
                                  case 0:
                                    title = 'Mon';
                                    break;
                                  case 1:
                                    title = 'Tue';
                                    break;
                                  case 2:
                                    title = 'Wed';
                                    break;
                                  case 3:
                                    title = 'Thu';
                                    break;
                                  case 4:
                                    title = 'Fri';
                                    break;
                                  default:
                                    title = '';
                                }
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  space: 8.0,
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: Colors.blue,  // Soft blue color for the bars
                                width: 20,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 10,
                                color: Colors.blue,  // Soft blue color for the bars
                                width: 20,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: Colors.blue,  // Soft blue color for the bars
                                width: 20,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 12,
                                color: Colors.blue,  // Soft blue color for the bars
                                width: 20,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 9,
                                color: Colors.blue,  // Soft blue color for the bars
                                width: 20,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCardButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomCardButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        color: Colors.grey[850],  // Dark grey card background
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
