import 'package:flutter/material.dart';
import 'package:learning/main.dart';

class bmiResult extends StatelessWidget {
  bmiResult(
      {super.key,
      required this.isMale,
      required this.age,
      required this.weight,
      required this.height});

  final bool isMale;
  final int age;
  final int weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    Color gui = Color(0xff090e21);
    Color mainColor = Color(0xff1d1e33);
    Color activeColor = Color(0xffeb1555);

    double result = (weight) / (height * height);
    String status = "NORMAL";
    String des = "You Have a normal body weight.";
    String subdes = "Good Job !";
    Color statusColor = Colors.green;
    if (result < 18.5) {
      status = "UNDERWEIGHT";
      des = "You Have a lower than normal body weight.";
      subdes = "Try to eat more !";
      statusColor = Colors.deepOrange;
    } else if (result < 25 && result >= 18.5) {
      status = "NORMAL";
      des = "You Have a normal body weight.";
      subdes = "Good Job.";
    } else if (result < 40 && result >= 25.0) {
      status = "Overweight";
      des = "You Have a higher than normal body weight.";
      subdes = "Try to eat less !";
      statusColor = Colors.deepOrange;
    } else {
      status = "Obese";
      des = "You Gonna Die soon.";
      subdes = "RIP";
      statusColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: gui,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: gui,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Results",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$status",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: statusColor),
                  ),
                  Text(
                    "${result.roundToDouble()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 85,
                        color: Colors.white),
                  ),
                  Column(
                    children: [
                      Text(
                        "Normal BMI Range :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '18.5 - 25 KG/M',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                                text: '2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFeatures: [
                                      FontFeature.superscripts()
                                    ])),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        des,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,

                        ),
                      ),
                      Text(
                        subdes,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
                backgroundColor: activeColor,
                shadowColor: Colors.black,
              ),
              onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
