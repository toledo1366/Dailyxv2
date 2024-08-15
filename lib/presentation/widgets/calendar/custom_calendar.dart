import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final List<String> _days =  ['Pon', 'Wt', 'Śr', 'Czw', 'Pt', 'Sob', 'Ndz'];

  @override
  void initState() {
    super.initState();
  }

  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay, 
      firstDay: DateTime(2000, 1,1), 
      lastDay: DateTime(2100, 12,31),
      locale: 'pl_PL',
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: CalendarFormat.week,
      headerVisible: false,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) => Padding(
          padding: const EdgeInsets.only(left: 5, right: 5), 
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Text('xD'),
                Text(day.day.toString())
              ],
            ),
          ),
        ),
        dowBuilder: (context, day) => Padding(
          padding: const EdgeInsets.only(left: 5, right: 5), 
          child: Container(
            color: Colors.transparent,
          ),
        )
      ),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
    );
  }
}





        // dowBuilder: (context, day) => Padding(
        //   padding: const EdgeInsets.only(left: 5, right: 5), 
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: Colors.white,
        //     ),
        //     child: RichText(
        //       text: TextSpan(
        //         style: const TextStyle(
        //           color: Colors.orange
        //         ),
        //         text: _days[day.weekday-1],
        //       ),
        //     ),
        //   ),
        // )