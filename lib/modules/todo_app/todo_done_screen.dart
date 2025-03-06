import 'package:flutter/material.dart';

class TodoDoneScreen extends StatelessWidget {
  const TodoDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index) => _taskBuilder(),
        separatorBuilder: (context, index) => Divider(height: 0, color: Colors.yellow, thickness: 2,),
        itemCount: 20
    );
  }

  Widget _taskBuilder(){
    return  Container(
      color: Colors.grey,
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (newValue){}),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Task Name'),
                Text('Task Date and Time'),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.archive))
        ],
      ),
    );
  }
}
