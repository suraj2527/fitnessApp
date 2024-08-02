import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/profile');
        }),
        title: Text('Activity Tracker', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
        ],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTodayTargetCard(),
            SizedBox(height: 20),
            _buildActivityProgressCard(),
            SizedBox(height: 20),
            _buildLatestActivityList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayTargetCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Today Target', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.add, color: Colors.blue),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.local_drink, color: Colors.blue, size: 30),
                    SizedBox(height: 5),
                    Text('8L', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Water Intake'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.directions_walk, color: Colors.yellow, size: 30),
                    SizedBox(height: 5),
                    Text('2400', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Foot Steps'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityProgressCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Activity Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                DropdownButton<String>(
                  value: 'Weekly',
                  items: <String>['Daily', 'Weekly', 'Monthly'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {

                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: _buildBarChartData(),
                  borderData: FlBorderData(
                    show: false
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Sun';
                              break;
                            case 1:
                              text = 'Mon';
                              break;
                            case 2:
                              text = 'Tue';
                              break;
                            case 3:
                              text = 'Wed';
                              break;
                            case 4:
                              text = 'Thu';
                              break;
                            case 5:
                              text = 'Fri';
                              break;
                            case 6:
                              text = 'Sat';
                              break;
                            default:
                              text = '';
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 4.0,
                            child: Text(text, style: style),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarChartData() {
    return [
      BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8,width: 20, color: Colors.blue)]),
      BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10,width: 20, color: Colors.blue)]),
      BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14,width: 20, color: Colors.blue)]),
      BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15,width: 20, color: Colors.purple)]),
      BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 13,width: 20, color: Colors.blue)]),
      BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 10,width: 20, color: Colors.blue)]),
      BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 12,width: 20, color: Colors.blue)]),
    ];
  }

  Widget _buildLatestActivityList() {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/drink.png'),
            ),
            title: Text('Drinking 300ml Water'),
            subtitle: Text('About 3 minutes ago'),
            trailing: Icon(Icons.more_vert),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/snack.png'),
            ),
            title: Text('Eat Snack (Fitbar)'),
            subtitle: Text('About 10 minutes ago'),
            trailing: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}


