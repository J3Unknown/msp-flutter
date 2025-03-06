import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  BmiResultScreen({super.key, required this.gender, required this.height, required this.age, required this.weight, required this.result});

  String gender;
  int height;
  int age;
  int weight;
  double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081020),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff081020),
        title: Text('BMI Calculator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff181b2d),
          ),
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Gender:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 10,),
                  Text(gender, style: TextStyle(color: Colors.grey),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Height:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 10,),
                  Text('$height', style: TextStyle(color: Colors.grey),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Age:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 10,),
                  Text('$age', style: TextStyle(color: Colors.grey),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Weight:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(width: 10,),
                  Text('$weight', style: TextStyle(color: Colors.grey),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Result:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('$result', style: TextStyle(color: Color(0xfff82b4a), fontSize: 24, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xfff82b4a),
                    padding: EdgeInsets.zero
                  ),
                  child: Text('Calculate Again' ,style: TextStyle(color: Colors.white),),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
