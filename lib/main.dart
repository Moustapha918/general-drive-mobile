import 'package:flutter/material.dart';
import 'package:general_mobile_drive/dashboard/car_detail.dart';
import 'package:general_mobile_drive/register/login_screen.dart';

import 'car_details/car_photos_screen.dart';
import 'car_details/details_screen.dart';
import 'dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
