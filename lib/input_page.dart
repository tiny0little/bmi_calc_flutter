import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'resources.dart';

enum enumGenderButtons { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  enumGenderButtons selectedGenderButton;
  int selectedWeight = 55;
  int selectedHeight = 165;
  int selectedAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            // *********** GENDER section *************

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary:
                              selectedGenderButton == enumGenderButtons.male
                                  ? kSelectedButtonTextColor
                                  : kNotSelectedButtonTextColor,
                          backgroundColor:
                              selectedGenderButton == enumGenderButtons.male
                                  ? kSelectedButtonColor
                                  : kNotSelectedButtonColor,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedGenderButton = enumGenderButtons.male;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.genderMale, size: 49),
                            Text('MALE'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary:
                              selectedGenderButton == enumGenderButtons.female
                                  ? kSelectedButtonTextColor
                                  : kNotSelectedButtonTextColor,
                          backgroundColor:
                              selectedGenderButton == enumGenderButtons.female
                                  ? kSelectedButtonColor
                                  : kNotSelectedButtonColor,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedGenderButton = enumGenderButtons.female;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.genderFemale, size: 49),
                            Text('FEMALE'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // ************** HEIGHT section **************

            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TextButton(
                    onPressed: null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('HEIGHT'),
                        MyValueText(value: selectedHeight, unit: 'cm'),
                        Slider(
                          value: selectedHeight.toDouble(),
                          min: 100,
                          max: 240,
                          onChanged: (double value) {
                            setState(() {
                              selectedHeight = value.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),

            // *********** WEIGHT and AGE section ***********

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        onPressed: null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('WEIGHT'),
                            MyValueText(value: selectedWeight, unit: 'kg'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyCircleButton(
                                  icon: Icon(MdiIcons.minusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedWeight > kMinWeight
                                          ? selectedWeight--
                                          : null;
                                    });
                                  },
                                ),
                                MyCircleButton(
                                  icon: Icon(MdiIcons.plusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedWeight < kMaxWeight
                                          ? selectedWeight++
                                          : null;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton(
                        onPressed: null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('AGE'),
                            MyValueText(value: selectedAge, unit: ''),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyCircleButton(
                                  icon: Icon(MdiIcons.minusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedAge > kMinAge
                                          ? selectedAge--
                                          : null;
                                    });
                                  },
                                ),
                                MyCircleButton(
                                  icon: Icon(MdiIcons.plusThick,
                                      color: kSelectedButtonTextColor),
                                  onPressed: () {
                                    setState(() {
                                      selectedAge < kMaxAge
                                          ? selectedAge++
                                          : null;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // *********** CALCULATE button section ***********

            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(
                        'CALCULATE',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
