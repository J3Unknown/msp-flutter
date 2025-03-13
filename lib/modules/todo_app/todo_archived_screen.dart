import 'package:flutter/material.dart';

class TodoArchivedScreen extends StatelessWidget {
  const TodoArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => _taskBuilder(),
      separatorBuilder: (context, index) => Divider(
        thickness: 1.5,
        color: Colors.yellow,
      ),
      itemCount: 5,
    );
  }

  Widget _taskBuilder() => Row(
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
  );
}
