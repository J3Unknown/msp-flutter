import 'package:flutter/material.dart';
import 'package:msp_project/modules/todo_app/todo_archived_screen.dart';
import 'package:msp_project/modules/todo_app/todo_done_screen.dart';
import 'package:msp_project/modules/todo_app/todo_screen.dart';

class TodoLayoutScreen extends StatefulWidget {
  TodoLayoutScreen({super.key});

  @override
  State<TodoLayoutScreen> createState() => _TodoLayoutScreenState();
}

class _TodoLayoutScreenState extends State<TodoLayoutScreen> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> titles = [
    'Todo',
    'Done',
    'Archived'
  ];
  List<Widget> screens = [
    TodoScreen(),
    TodoDoneScreen(),
    TodoArchivedScreen()
  ];

  final TextEditingController _TaskTitleController = TextEditingController();
  final TextEditingController _TaskDateController = TextEditingController();
  final TextEditingController _TaskTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.timer_sharp,), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box_outlined), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived'),
        ],
        onTap: (newValue){
          setState(() {
            currentIndex = newValue;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _scaffoldKey.currentState!.showBottomSheet(
            (context) => _bottomSheetBuilder(),
          );
        }
      ),
    );
  }

  Widget _bottomSheetBuilder(){
    return Container(
      padding: EdgeInsets.all(20),
      height: 300,
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _TaskTitleController,
              decoration: InputDecoration(
                label: Text('Task Title'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon: Icon(Icons.text_format),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _TaskDateController,
              decoration: InputDecoration(
                label: Text('Task Date'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon: Icon(Icons.date_range),
              ),
              keyboardType: TextInputType.datetime,
              onTap: () async {
                _TaskDateController.text = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2027)).toString();
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _TaskTimeController,
              decoration: InputDecoration(
                label: Text('Task Time'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon: Icon(Icons.timer),
              ),
              keyboardType: TextInputType.datetime,
              onTap: () async{
                _TaskTimeController.text = await showTimePicker(context: context, initialTime: TimeOfDay.now()).toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}
