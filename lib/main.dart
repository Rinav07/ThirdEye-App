import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:thirdeye/constant.dart';

import 'loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SplashScreen(
          seconds: 2,
          navigateAfterSeconds: const LoginPage(),
          image: Image.asset(
            'assets/Group 48.png',
          ),
          photoSize: 182,
          backgroundColor: pblack,
          useLoader: false,
          loadingText: Text(
            'Designed by Bhagwan Bharose',
            style: TextStyle(
              fontSize: 12,
              color: pyellow,
            ),
          ),
        ),
      ),
    );
  }
}
