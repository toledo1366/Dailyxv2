import 'package:dailyx/presentation/pages/main/cubit/main_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          Center(child: Text(widget.task.summary),),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(BlocProvider.of<MainPageCubit>(context).calculateTaskEndTime(widget.task)),
          ),
        ],
      ),
    );
  }
}