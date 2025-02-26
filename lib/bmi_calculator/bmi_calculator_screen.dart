import 'dart:math';

import 'package:flutter/material.dart';
import 'package:msp_project/bmi_calculator/bmi_result_screen.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

  bool isMale = true;
  double sliderVal = 150;
  int age = 20;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081020),
      appBar: AppBar(
        backgroundColor: Color(0xff081020),
        title: Text('BMI Calculator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      if(!isMale){
                        setState(() {
                          isMale = true;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isMale?Color(0xfff82b4a):Color(0xff181b2d),
                      ),
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, color: Colors.white,  size: 80,),
                          Text('MALE',  style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      if(isMale){
                        setState(() {
                          isMale = false;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: !isMale?Color(0xfff82b4a):Color(0xff181b2d),
                      ),
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, color: Colors.white,  size: 80,),
                          Text('FEMALE',  style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff181b2d),
              ),
              height: 170,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${sliderVal.round()}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('cm', style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  Slider(
                    value: sliderVal,
                    onChanged: (value){
                      setState(() {
                        sliderVal = value;
                      });
                    },
                    max: 200,
                    min: 50,
                    activeColor: Color(0xfff82b4a),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff181b2d),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        Text('$age', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(age > 0){
                                    setState(() {
                                      --age;
                                    });
                                  }
                                },
                                child: Icon(Icons.minimize, color: Colors.white,),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.zero
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ++age;
                                  });
                                },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.zero
                                  ),
                                child: Icon(Icons.add, color: Colors.white,)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff181b2d),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        Text('$weight', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(weight > 0){
                                    setState(() {
                                      --weight;
                                    });
                                  }
                                },
                                child: Icon(Icons.minimize, color: Colors.white,),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.zero
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      ++weight;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.zero
                                  ),
                                  child: Icon(Icons.add, color: Colors.white,)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  var result = (weight/sqrt(sliderVal.round()));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResultScreen(gender: isMale?'male':'female', height: sliderVal.round(), age: age, weight: weight, result: result.roundToDouble())));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xfff82b4a),
                    padding: EdgeInsets.zero
                ),
                child: Text('Calculate' ,style: TextStyle(color: Colors.white),),
              )
            )
          ],
        ),
      ),
    );
  }
}
