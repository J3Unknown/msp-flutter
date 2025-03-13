import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_states.dart';

import '../../../modules/todo_app/todo_archived_screen.dart';
import '../../../modules/todo_app/todo_done_screen.dart';
import '../../../modules/todo_app/todo_screen.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  IconData fabIcon = Icons.edit;
  bool isBottomSheetShown = false;

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

  void changeBottomNavBarIndex(int index){
    currentIndex = index;
    emit(TodoBottomNavBarChangeIndexState());
  }

  void changeBottomSheetState({IconData icon = Icons.edit, bool isBottomShown = false}){
    fabIcon = icon;
    isBottomSheetShown = isBottomShown;
    emit(TodoChangeBottomSheetState());
  }

  void changeDismissibleState(){
    print(state);
    emit(TodoChangeDismissibleState());
  }
}