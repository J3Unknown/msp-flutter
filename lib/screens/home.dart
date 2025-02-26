import 'package:flutter/material.dart';
import 'package:learning/main.dart';
import 'package:learning/screens/results.dart';

class bmiHome extends StatefulWidget {
  const bmiHome({super.key});

  @override
  State<bmiHome> createState() => _bmiHomeState();
}

class _bmiHomeState extends State<bmiHome> {
  Color gui = Color(0xff090e21);
  Color mainColor = Color(0xff1d1e33);
  Color activeColor = Color(0xffeb1555);

  int age = 20;
  int weight = 60;
  bool isMale = true;

  double sliderVal = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gui,
      appBar: AppBar(
        backgroundColor: gui,
        foregroundColor: Colors.white,
        title: Text("BMI APP"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: gui,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (!isMale) {
                            isMale = true;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isMale ? activeColor : mainColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 100,
                            ),
                            Text(
                              "Male",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 27),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (isMale) {
                            isMale = false;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isMale ? mainColor : activeColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 100,
                            ),
                            Text(
                              "Female",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 27),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), // First Container
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${sliderVal.round()}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Color(0xff1f3a61),
                      thumbColor: activeColor,
                      value: sliderVal,
                      onChanged: (value) {
                        setState(() {
                          sliderVal = value;
                        });
                      },
                      min: 10,
                      max: 250,
                    )
                  ],
                ),
              ),
            ), // Second Container
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Color(0xff4c4f5c),
                                  shadowColor: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) {
                                      --weight;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.exposure_minus_1_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Color(0xff4c4f5c),
                                  shadowColor: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    ++weight;
                                  });
                                },
                                child: Icon(
                                  Icons.plus_one_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Color(0xff4c4f5c),
                                  shadowColor: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) {
                                      --age;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.exposure_minus_1_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Color(0xff4c4f5c),
                                  shadowColor: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    ++age;
                                  });
                                },
                                child: Icon(
                                  Icons.plus_one_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), // Third Container
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
                backgroundColor: activeColor,
                shadowColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bmiResult(isMale: isMale, age: age, weight: weight, height: sliderVal/100,)),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CALCULATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
