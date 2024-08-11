import 'package:flutter/material.dart';

import '../../../../domain/models/tasks/task.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  const TaskListItem({super.key, required this.task});

  @override
  State<TaskListItem> createState() => _ListItemState();
}

class _ListItemState extends State<TaskListItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 218, 162),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Checkbox(
            value: isDone, 
            onChanged: (value) {
              setState(() {
                isDone = value!;
              });
            }),
          Center(child: Text(widget.task.summary),)
        ],
      ),
    );
  }
}