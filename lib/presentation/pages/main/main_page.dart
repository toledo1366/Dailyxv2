import 'package:dailyx/core/di/di.dart';
import 'package:dailyx/core/routing/app_router.dart';
import 'package:dailyx/presentation/pages/main/widgets/diary_summary_entry_widget/diary_summary_entry_widget.dart';
import 'package:dailyx/presentation/widgets/end_drawer/custom_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:intl/intl.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../widgets/bottombar/custom_bottombar.dart';
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
      child: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 218, 162),
          appBar: AppBar(
            centerTitle: false,
            title: const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
                child: StrokeText(
                text: 'Cześć, Damian!', 
                textStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                strokeWidth: 2,
                strokeColor: Colors.black,
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
              ),
              side: BorderSide(color: Colors.black)
            ),
            backgroundColor: const Color.fromARGB(255, 132, 200, 255),
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 50), 
              child: Container(
                child: buildDaySelector(context),
              ),
            ),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  padding: const EdgeInsets.only(top: 10),
                  icon: const DecoratedIcon(icon: Icon(Icons.more_horiz, color: Colors.white,),decoration: IconDecoration(border: IconBorder(width: 2)),),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),
          body: state.map(
            created: (_) => SafeArea(
              bottom: false,
              child: buildContent(context),
            ), 
            loading: (_) => Container(), 
            error: (message) => Container()
          ),
          endDrawer: const CustomEndDrawer(),
          bottomNavigationBar: const CustomBottombar(),
        ),
      ),
    );
  }
  
  Widget buildContent(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0, right: 20.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DiarySummaryEntryWidget()
          // const Padding(
          //   padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0), 
          //   child: Text(
          //     'Podsumowanie',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 15,
          //     ),
          //   ),
          // ),        
          // buildSummary(context),
          // Expanded(
          //   flex: 3,
          //   child: ListView.builder(
          //     itemCount: tasks.length,
          //     itemBuilder: (context, index) => TaskListItem(task: tasks[index])
          //   ),
          // ),
        ],
      ),
    );
  }

  void _navigateToTaskCreationForm() {
    router.go('/task_creation_form');
  }
  
  Widget buildDaySelector(BuildContext context) {
    DateFormat formatter = DateFormat('EEEE,', 'pl_PL').add_yMd();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (){
            setState(() {
              focusedDay = focusedDay.subtract(const Duration(days: 1));
              BlocProvider.of<MainPageCubit>(context).getTasksList(focusedDay);
            });
          }, 
          icon: const DecoratedIcon(
            decoration: IconDecoration(
              border: IconBorder(
                width: 2
              )
            ),
            icon: Icon(
              Icons.arrow_left_rounded, 
              color: Colors.white, 
              size: 50,
            )
          )
        ),
        StrokeText(
          text: formatter.format(focusedDay),
          strokeWidth: 1.8,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              focusedDay = focusedDay.add(const Duration(days: 1));
              BlocProvider.of<MainPageCubit>(context).getTasksList(focusedDay);
            });
          }, 
          icon: const DecoratedIcon(
            decoration: IconDecoration(
              border: IconBorder(
                width: 2
              )
            ),
            icon: Icon(
              Icons.arrow_right_rounded, 
              color: Colors.white, 
              size: 50,
            )
          )
        ),
      ],
    );
  }

  Widget buildSummary(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: GridView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            mainAxisExtent: 175
          ),
          children: [
            GestureDetector(
              onTap: (){},
              child: const Card(
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color.fromARGB(255, 172, 173, 255),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '24',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Oczekujące')
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: const Card(
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color.fromARGB(255, 255, 94, 94),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '24',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('W trakcie')
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: const Card(
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color.fromARGB(255, 104, 210, 255),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '24',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Po terminie')
                    ],
                  ),
                ),  
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: const Card(
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color.fromARGB(255, 131, 255, 135),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '24',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Zakończone')
                    ],
                  ),
                ),  
              ),
            ),
          ],
        ),
      )
    );
  }
}