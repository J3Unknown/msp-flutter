import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_cubit.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_states.dart';

class TodoLayoutScreen extends StatefulWidget {
  const TodoLayoutScreen({super.key});

  @override
  State<TodoLayoutScreen> createState() => _TodoLayoutScreenState();
}

class _TodoLayoutScreenState extends State<TodoLayoutScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..createDatabase(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state){
          if(state is TodoInsertDataIntoDatabaseSuccessState){
            Navigator.of(context).pop();
            _taskTitleController.clear();
            _taskDateController.clear();
            _taskTimeController.clear();
          }
        },
        builder: (context, state) {
          TodoCubit cubit = TodoCubit.get(context);
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              centerTitle: true,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined), label: 'Todo'),
                BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Done'),
                BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived'),
              ],
              onTap: (newIndex){
                cubit.changeBottomNavBarIndex(newIndex);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isBottomSheetShown){
                  if(_formKey.currentState!.validate()){
                    print(_taskTitleController.text);
                    print(_taskTimeController.text);
                    print(_taskDateController.text);
                    cubit.insertToDatabase(title: _taskTitleController.text, date: _taskDateController.text, time: _taskTimeController.text);
                  }
                } else{
                  _scaffoldKey.currentState!.showBottomSheet((context)=>Container(
                    height: 300,
                    padding: EdgeInsets.all(35),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _taskTitleController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Task Title',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.blue)
                                ),
                                prefixIcon: Icon(Icons.abc),
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'This field must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20,),
                            InkWell(
                              onTap: () {
                                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.parse('2027-12-31')).then((value){
                                  if(value != null){
                                    _taskDateController.text = DateFormat('dd - MMM - yyyy').format(value);
                                  }
                                });
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _taskDateController,
                                  keyboardType: TextInputType.none,
                                  decoration: InputDecoration(
                                    hintText: 'Task Date',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue)
                                    ),
                                    prefixIcon: Icon(Icons.date_range),
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return 'This field must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            InkWell(
                              onTap: () {
                                showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                                  if(value != null){
                                    _taskTimeController.text = value.format(context).toString();
                                  }
                                });
                              },
                              //TODO: add it to component file
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _taskTimeController,
                                  keyboardType: TextInputType.none,
                                  decoration: InputDecoration(
                                    hintText: 'Task Time',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue)
                                    ),
                                    prefixIcon: Icon(Icons.timer),
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return 'This field must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  )).closed.then((value){
                    cubit.changeBottomSheetState(icon: Icons.edit);
                    _taskTitleController.clear();
                    _taskDateController.clear();
                    _taskTimeController.clear();
                  });
                  cubit.changeBottomSheetState(icon: Icons.add, isBottomShown: true);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
          );
        },
      ),
    );
  }
}

