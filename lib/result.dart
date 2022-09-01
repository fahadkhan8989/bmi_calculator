// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class Result extends StatelessWidget {
  Result(
      {required this.bmi, required this.result, required this.interpretation});

  late String bmi;
  late String result;
  late String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kYourResultStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xff22E57B),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmi,
                      style: kResultNumberStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: Color(0xFFEB1555),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
