import 'package:demo/SubScreens/vedio_info.dart';
import 'package:demo/pages/bottom_navbar.dart';
import 'package:demo/pages/profile.dart';
import 'package:demo/pages/signin.dart';
import 'package:demo/pages/traning.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo/pages/yoga.dart';
import 'package:demo/pages/HomePage.dart'
;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),


    );
  }
}
