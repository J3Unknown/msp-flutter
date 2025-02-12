import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        iconTheme: IconThemeData(),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () => {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Main Body",
            style: TextStyle(
                fontSize: 50,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "First Part of the main Body",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 110,
            color: Colors.grey,
            child: Row(
              children: [
                Icon(Icons.star_outline_sharp),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Second Part of the main Body",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(

              // color: Colors.greenAccent,
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.greenAccent,
            child: Column(
              children: [
                Text(
                  "Second Part of the main Body",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.red,
                      child: Text("First Part"),
                      height: double.infinity,
                    ),
                    Container(
                      color: Colors.blue,
                      child: Text("Second Part"),
                      height: double.infinity,
                    ),
                    Container(
                      color: Colors.yellow,
                      child: Text("Third Part"),
                      height: double.infinity,
                    ),
                  ],
                ),),
              ],
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.pink,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
