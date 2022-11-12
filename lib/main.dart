import 'package:flutter/material.dart';
import 'package:flutter_auth_animation/home_page.dart';
import 'package:flutter_auth_animation/splash_screen.dart';
import 'auth_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Animation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white30,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            // hintStyle: TextStyle(color: Colors.white70),
            contentPadding: EdgeInsets.symmetric(
                vertical: defpaultPadding * 1.2, horizontal: defpaultPadding),
          ),
        ),
        home: SplashScreen(),
        initialRoute: '/',
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => AuthScreen(),
        });
  }
}
