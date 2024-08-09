import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages/signin.dart';
import 'package:demo/pages/signup.dart';
import 'package:demo/pages/profile.dart';
import 'package:demo/pages/food.dart';
import 'package:demo/pages/traning.dart';
import 'package:demo/pages/HomePage.dart';
import 'package:demo/pages/yoga.dart';

import 'package:demo/SubScreens/editProfile.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      routes: {
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => Profile(),
        '/food': (context) => FoodMenuScreen(),
        '/training': (context) => MyListView(),
        '/home' : (context) => HomePage(),
        '/editProfile' :(context) => EditProfilePage(),
        '/signIn' : (context) => SignInPage(),
        '/yoga' :(context) => YogaScreen(),
      },
    );
  }
}
