import 'package:demo/traning.dart';
import 'package:flutter/material.dart';
import 'colorextension.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo/food.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String lang = 'English';
  var items = ['English', 'Hindi'];
  bool _notificationswitch = true;
  bool _darkswitch = false;

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: TColor.lightGray,
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: TColor.lightGray,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: Height * 0.01,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: TColor.primaryColor2,
                      child: Icon(CupertinoIcons.person),
                    ),
                  ),
                  title: Text(
                    "Suraj",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  subtitle: Text(
                    "Weight Gainer",
                    style: TextStyle(color: TColor.gray),
                  ),
                  trailing: Container(
                    width: Width * 0.2,
                    height: Height * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          TColor.primaryColor1,
                          TColor.primaryColor2,
                        ])),
                    child: Center(
                        child: Text(
                      "Edit",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: TColor.gray),
                    )),
                  ),
                ),
                SizedBox(
                  height: Height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: Height * 0.08,
                      width: Width * 0.25,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "180cm",
                              style: TextStyle(
                                  color: TColor.primaryColor1, fontSize: 18),
                            ),
                            Text(
                              "Height",
                              style: TextStyle(color: TColor.gray),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      height: Height * 0.08,
                      width: Width * 0.25,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "55Kg",
                              style: TextStyle(
                                color: TColor.primaryColor1,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Weight",
                              style: TextStyle(color: TColor.gray),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      height: Height * 0.08,
                      width: Width * 0.25,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "19Yr",
                              style: TextStyle(
                                  color: TColor.primaryColor1, fontSize: 18),
                            )),
                            Text(
                              "Age",
                              style: TextStyle(color: TColor.gray),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: TColor.primaryColor1,
                              size: 22,
                            ),
                            title: Text(
                              "Personal Data",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: TColor.gray,
                              size: 18,
                            ),
                            onTap: () {
                              print(("Tapped"));
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.insert_chart_outlined_rounded,
                              color: TColor.primaryColor1,
                              size: 22,
                            ),
                            title: Text(
                              "Workout Progress",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: TColor.gray,
                              size: 18,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.notifications_active_outlined,
                              color: TColor.primaryColor1,
                            ),
                            title: Text(
                              "Notification",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: CupertinoSwitch(
                              value: _notificationswitch,
                              onChanged: (value) {
                                setState(() {
                                  _notificationswitch = value;
                                });
                              },
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Others",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          ListTile(
                              leading: Icon(
                                Icons.language_outlined,
                                color: TColor.primaryColor1,
                              ),
                              title: Text(
                                "Language",
                                style: TextStyle(color: TColor.gray),
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  value: lang,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                            color: TColor.gray, fontSize: 12),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      lang = newValue!;
                                    });
                                  },
                                ),
                              )),
                          ListTile(
                            leading: Icon(
                              Icons.next_plan_outlined,
                              color: TColor.primaryColor1,
                              size: 22,
                            ),
                            title: Text(
                              "Plan Setting",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: TColor.gray,
                              size: 18,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.email_outlined,
                              color: TColor.primaryColor1,
                              size: 22,
                            ),
                            title: Text(
                              "Contact Us",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: TColor.gray,
                              size: 18,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.dark_mode_outlined,
                              color: TColor.primaryColor1,
                            ),
                            title: Text(
                              "Dark Mode",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: CupertinoSwitch(
                              value: _darkswitch,
                              onChanged: (value) {
                                setState(() {
                                  _darkswitch = value;
                                });
                              },
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: TColor.lightGray,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 1,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home, size: 23), label: "Home"),
                  BottomNavigationBarItem(
                      icon: CupertinoButton(
                        child: ImageIcon(
                          AssetImage("images/fit.png"),
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                      label: "Training"),
                  BottomNavigationBarItem(
                      icon: CupertinoButton(
                          child: ImageIcon(
                            AssetImage("images/food.png"),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodMenuScreen()));
                          }),
                      label: "Food"),
                  BottomNavigationBarItem(
                      icon: CupertinoButton(
                          child: Icon(
                            CupertinoIcons.person,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          }),
                      label: "Profile"),
                ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Theme(
          data: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: TColor.primaryColor2)),
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: Container(
              decoration: BoxDecoration(),
              child: const Icon(CupertinoIcons.chat_bubble),
            ),
          ),
        ));
  }
}
