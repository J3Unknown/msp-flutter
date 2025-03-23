import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_cubit.dart';
import 'package:msp_project/layout/todo_layout/cubit/todo_states.dart';
import 'package:msp_project/shared/components/components.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state){},
      builder: (context, state) => taskBuilder(
        TodoCubit.get(context).newTasks,
        state
      ),
    );
  }

}
