import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_states.dart';
import 'package:msp_project/models/todo_app/todo_task_model.dart';

import '../../layout/todo_layout/cubit/todo_cubit.dart';

Widget taskBuilder(
    List<TodoTaskModel> tasks,
    state
  ) => ConditionalBuilder(
    condition: state is !TodoGetDataFromDatabaseLoadingState && tasks.isNotEmpty,
    fallback: (context) {
      if(state is TodoGetDataFromDatabaseLoadingState){
        return CircularProgressIndicator();
      }
      return Center(child: Text('No Tasks Yet'));
    },
    builder: (context) => ListView.separated(
      separatorBuilder: (context, index) => Divider(
        thickness: 1.5,
        color: Colors.yellow,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(tasks[index].id.toString()),
        onDismissed: (dismissDirection){
          if(dismissDirection == DismissDirection.startToEnd){
            print('Task Archived');
          }else if(dismissDirection == DismissDirection.endToStart){
            TodoCubit.get(context).updateDismissibleDeleteState(tasks, index);
          }
        },
        background: Container(
          color: Colors.green,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          child: Icon(Icons.archive, color: Colors.white,),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(20),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
        child: Row(
          children: [
            Checkbox(value: false, onChanged: (checked){}),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tasks[index].title, style: TextStyle(fontSize: 24),),
                  Text('${tasks[index].date} ${tasks[index].time}', style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.archive))
          ],
        ),
      ),
    ),
  );