import 'package:flutter/material.dart';

class CounterAppScreen extends StatefulWidget {
  CounterAppScreen({super.key});

  @override
  State<CounterAppScreen> createState() => _CounterAppScreenState();
}

class _CounterAppScreenState extends State<CounterAppScreen> {
  int number = 0;

  @override
  void initState() {
    number  = 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  setState(() {
                    --number;
                  });
                  print(number);
                  },
                icon: Icon(Icons.exposure_minus_1, size: 40,)
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('$number', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
              ),
              IconButton(onPressed: (){
                setState(() {
                  ++number;
                });
                print(number);
                }, icon: Icon(Icons.plus_one, size: 40,))
            ],
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                number = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))
              )
            ),
            child: Text('Zero')
          )
        ],
      ),
    );
  }
}
