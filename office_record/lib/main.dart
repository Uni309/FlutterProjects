import 'package:flutter/material.dart';
import 'package:office_record/screen/home_screen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'sunflower',
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          color: Colors.black,
          fontFamily: 'parisienne',
          fontSize: 80
        ),
        displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 20
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 50,
          fontWeight: FontWeight.w700
        ),
      )
    ),
      home: const HomeScreen(),
    ),
  );
}
