import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/SubScreens/editProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../SubScreens/workoutProgress.dart';
import '../colorextension.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  DocumentSnapshot? _userData;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (_user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      setState(() {
        _userData = userData;
      });
    }
  }

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
          backgroundColor: TColor.primaryColor1,
        ),
        body: _userData == null
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
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
                    '${_userData!['name']}',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  subtitle: Text(
                    "Weight Gainer",
                    style: TextStyle(color: TColor.gray),
                  ),
                  trailing:
                  CupertinoButton(
                    child: Container(
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage() ));
                    }
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
                              '${_userData!['height']}',
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
                              '${_userData!['weight']}',
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
                                  '${_userData!['age']}',
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
                              Navigator.pushNamed(context, '/editProfile');
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
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityTrackerPage()));
                            },
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
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.logout_outlined,
                              color: TColor.primaryColor1,
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(color: TColor.gray),
                            ),
                            trailing: Text("log Out",
                            style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14),),
                            onTap: () {
                              // Navigator.pushReplacementNamed(context, '/signIn');
                              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                            },
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
            height: 60,
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
                      icon: IconButton(
                        icon: Icon(CupertinoIcons.home, size: 23),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: IconButton(
                        icon: ImageIcon(
                          AssetImage("images/fit.png"),
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/training');
                        },
                      ),
                      label: "Training"),
                  BottomNavigationBarItem(
                      icon: IconButton(
                        icon: ImageIcon(
                          AssetImage("images/food.png"),
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/food');
                        },
                      ),
                      label: "Food"),
                  BottomNavigationBarItem(
                      icon: IconButton(
                        icon: Icon(CupertinoIcons.person),
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/profile');
                        },
                      ),
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
