import 'package:dailyx/core/di/di.dart';
import 'package:dailyx/core/routing/app_router.dart';
import 'package:dailyx/presentation/pages/main/widgets/tasks_list_item.dart';
import 'package:dailyx/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:dailyx/presentation/widgets/end_drawer/custom_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/tasks/task.dart';
import 'cubit/main_page_cubit.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  

  @override
  Widget build(BuildContext context) {
    final MainPageCubit cubit = di.get<MainPageCubit>();
    cubit.getTasksList();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Cześć'),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 255, 218, 162),
          child: BlocProvider<MainPageCubit>(
            create: (context) => cubit,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<MainPageCubit, MainPageState>(
                builder: (context, state) => state.maybeMap(
                  tasksLoaded: (value) => _buildContent(context, cubit, value.tasks),
                  orElse: () => Container(color: Colors.red,)
                )
              ),
            ),
          ),
        ),
      ),
      endDrawer: const CustomEndDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 218, 162),
        child: const Icon(
          Icons.add, 
          color: Colors.white,
        ),
        onPressed: () => _navigateToTaskCreationForm()
      ),
    );
  }
  
  Widget _buildContent(BuildContext context, MainPageCubit cubit, List<Task> tasks) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskListItem(task: tasks[index])
          ),
        ),
      ],
    );
  }

  void _navigateToTaskCreationForm() {
    router.go('/task_creation_form');
  }
}
