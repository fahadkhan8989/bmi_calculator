// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Color(0xff8d8E98),
          thumbColor: Color(0xFFEB1555),
          overlayColor: Color(0x29EB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
        ),
      ),
      home: const InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => Result(),
      // },
    );
  }
}
