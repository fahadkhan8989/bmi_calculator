// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'card_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'bmi_calculate.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;

  int weight = 70;
  int height = 180;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardContent(
                      icon: (FontAwesomeIcons.mars),
                      gender: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardContent(
                      icon: (FontAwesomeIcons.venus),
                      gender: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              "cm",
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 260,
                          // activeColor: Color(0xffeb1555),
                          inactiveColor: Color(0xff8d8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 150) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiCalculate calc = BmiCalculate(height: height, weight: weight);
              // Navigator.pushNamed(context, '/result');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: calc.calculate(),
                    result: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE YOUR BMI",
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

  List cmToFeet() {
    int feet = 0;
    int inches = 0;
    //  double dCentimeter = Double.valueOf(centemeter);
    //         feetPart = (int) Math.floor((dCentimeter / 2.54) / 12);
    //         System.out.println((dCentimeter / 2.54) - (feetPart * 12));
    //         inchesPart = (int) Math.ceil((dCentimeter / 2.54) - (feetPart * 12));

    feet = ((height / 2.54) / 12).floor();
    inches = ((height / 2.54) - (feet * 12)).ceil();

    return [feet, inches];
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  late IconData icon;
  late VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 5,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4f5E),
    );
  }
}
