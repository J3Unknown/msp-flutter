import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_states.dart';
import 'package:msp_project/models/todo_app/todo_task_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/todo_app/todo_archived_screen.dart';
import '../../../modules/todo_app/todo_done_screen.dart';
import '../../../modules/todo_app/todo_screen.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  IconData fabIcon = Icons.edit;
  bool isBottomSheetShown = false;
  var database;

  final List<Widget> screens = [
    TodoScreen(),
    TodoDoneScreen(),
    TodoArchivedScreen()
  ];

  final List<String> titles = [
    'Todo',
    'Done',
    'Archived'
  ];

  List<TodoTaskModel> newTasks = [];
  List<TodoTaskModel> doneTasks = [];
  List<TodoTaskModel> archivedTasks = [];


  void createDatabase(){
    openDatabase(
      'todo_db.db',
      version: 1,
      onCreate: (database, version){
        print('Database Created Successfully');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
          print('Table Created');
        }).catchError((error){
          print('An error occurred while creating table: ${error.toString()}');
        });
      },
      onOpen: (database){
        getDataFromDatabase(database);
      },
    ).then((value){
      database = value;
      emit(TodoCreateDatabaseSuccessState());
    });
  }

  void getDataFromDatabase(database){
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(TodoGetDataFromDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value){
      value.forEach((element){
        if(element['status'] == 'new'){
          newTasks.add(TodoTaskModel(id: element['id'], title: element['title'], date: element['date'], time: element['time'], status: element['status']));
        } else if(element['status'] == 'done'){
          doneTasks.add(TodoTaskModel(id: element['id'], title: element['title'], date: element['date'], time: element['time'], status: element['status']));
        } else{
          archivedTasks.add(TodoTaskModel(id: element['id'], title: element['title'], date: element['date'], time: element['time'], status: element['status']));
        }
      });
      emit(TodoGetDataFromDatabaseSuccessState());
    });
  }

  insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async{
    return await database.transaction((txn) async{
      txn.rawInsert('INSERT INTO tasks(title, date, time, status) VALUES(?,?,?,?)',[title, date, time, 'new']).then((value){
        getDataFromDatabase(database);
        emit(TodoInsertDataIntoDatabaseSuccessState());
      });
      return null;
    });
  }

  void changeBottomNavBarIndex(int index){
    currentIndex = index;
    emit(TodoBottomNavBarChangeIndexState());
  }

  void changeBottomSheetState({IconData icon = Icons.edit, bool isBottomShown = false}){
    fabIcon = icon;
    isBottomSheetShown = isBottomShown;
    emit(TodoChangeBottomSheetState());
  }

  void updateDismissibleDeleteState(List<TodoTaskModel> tasks, index){
    tasks.removeAt(index);
    emit(TodoDismissibleDeleteState());
  }

}
