import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});
  //TODO: add the list and apply the remove logic to fix the separator error
  //TODO: add component file and add the _taskBuilder in it
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _taskBuilder(index),
      separatorBuilder: (context, index) => Divider(
        thickness: 1.5,
        color: Colors.yellow,
      ),
      itemCount: 10,
    );
  }

  Widget _taskBuilder(index) => Dismissible(
    key: Key(index.toString()),
    onDismissed: (dismissDirection){
      if(dismissDirection == DismissDirection.endToStart){
        print('Task Deleted');
      }else if(dismissDirection == DismissDirection.endToStart){
        print('Task Deleted');
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
              Text('Task Name', style: TextStyle(fontSize: 24),),
              Text('Task Date And Time', style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.archive))
      ],
    ),
  );
}
