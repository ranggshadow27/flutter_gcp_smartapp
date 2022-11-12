import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth_animation/theme.dart';

void main(List<String> args) {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.popAndPushNamed(context, '/login'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blueColor,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/gcpt_2.png',
                width: 220,
              ),
              CircularProgressIndicator(
                color: whiteColor,
                strokeWidth: 1,
              ),
              SizedBox(height: 20),
              Text(
                "Loading Application",
                style: interSemibold.copyWith(
                  color: whiteColor,
                  fontSize: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
