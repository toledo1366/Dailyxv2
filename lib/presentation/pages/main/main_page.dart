import 'package:dailyx/core/di/di.dart';
import 'package:dailyx/core/routing/app_router.dart';
import 'package:dailyx/presentation/pages/main/widgets/tasks_list_item.dart';
import 'package:dailyx/presentation/widgets/end_drawer/custom_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/tasks/task.dart';
import 'cubit/main_page_cubit.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final MainPageCubit cubit = di.get<MainPageCubit>();
    cubit.getTasksList(focusedDay);

    return BlocProvider<MainPageCubit>(
      create: (context) => cubit,
      
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 218, 162),
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 30, left: 15),
            child: Text(
            'Cześć, Damian!', 
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)
          )
        ),
        backgroundColor: const Color.fromARGB(255, 132, 200, 255),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 100), 
          child: Container(
            child: buildDaySelector(context),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              padding: const EdgeInsets.only(top: 30),
              icon: const Icon(Icons.more_horiz, color: Colors.white,),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          // color: const Color.fromARGB(255, 255, 218, 162),
          child: BlocProvider<MainPageCubit>(
            create: (context) => cubit,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<MainPageCubit, MainPageState>(
                builder: (context, state) => state.maybeMap(
                  tasksLoaded: (value) => buildContent(context, cubit, value.tasks),
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
  
  Widget buildContent(BuildContext context, MainPageCubit cubit, List<Task> tasks) {
    return Column(
      children: [
        
        Expanded(
          child: ListView.builder(
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
  
  Widget buildDaySelector(BuildContext context) {
    DateFormat formatter = DateFormat('EEEE, d MMMM, y', 'pl_PL');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (){
            setState(() {
              focusedDay = focusedDay.subtract(Duration(days: 1));
              BlocProvider.of<MainPageCubit>(context).getTasksList(focusedDay);
            });
          }, 
          icon: const Icon(Icons.arrow_left_rounded, color: Colors.white, size: 50,),
        ),
        Text(
          formatter.format(focusedDay),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              focusedDay = focusedDay.add(Duration(days: 1));
              BlocProvider.of<MainPageCubit>(context).getTasksList(focusedDay);
            });
          }, 
          icon: const Icon(Icons.arrow_right_rounded, color: Colors.white, size: 50,)
        ),
      ],
    );
  }
}