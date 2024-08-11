import 'package:dailyx/core/di/di.dart';
import 'package:dailyx/presentation/pages/task_creation_form/cubit/task_creation_form_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/routing/app_router.dart';

class TaskCreationFormPage extends StatefulWidget {
  const TaskCreationFormPage({super.key});

  @override
  State<TaskCreationFormPage> createState() => _TaskCreationFormPageState();
}

class _TaskCreationFormPageState extends State<TaskCreationFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final double _kItemExtent = 32.0;
  final List<String> _durations = <String>[
    'Nie powtarzaj',
    'Codziennie',
    'Co 2 dni',
    'Co 3 dni',
    'Co tydzień',
    'Co miesiąc'
  ];

  int _selectedDuration = 0;
  String _selectedDurationText = '';
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String _startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _endDate = '';

  @override
  Widget build(BuildContext context) {
    _selectedDurationText = _durations[_selectedDuration];

    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          'Nowe zadanie',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: BlocProvider<TaskCreationFormCubit>(
        create: (context) => di.get<TaskCreationFormCubit>(),
        child: BlocConsumer<TaskCreationFormCubit, TaskCreationFormState>(
          listener: (context, state) {
            if(state == const TaskCreationFormState.taskCreated()){
              _navigateBack();
            }
          },
          builder: (context, state) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Tytuł'),
                      hintText: 'Wprowadź tytuł',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      )
                    ),
                    onChanged: (value) => BlocProvider.of<TaskCreationFormCubit>(context).title = value,
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Opis'),
                      hintText: 'Wprowadź krótki opis',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      )
                    ),
                    maxLines: 5,
                    onChanged: (value) => BlocProvider.of<TaskCreationFormCubit>(context).description = value,
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Data rozpoczęcia: ', 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(_startDate, style: const TextStyle(fontSize: 20),),
                      IconButton(onPressed: () async => await _showDateTimePicker(context, true), icon: const Icon(Icons.calendar_month, )),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Data zakończenia: ', 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      _endDate.isEmpty ? const Spacer() : Text(_endDate, style: const TextStyle(fontSize: 20),),
                      IconButton(onPressed: () async => await _showDateTimePicker(context, false), icon: const Icon(Icons.calendar_month, )),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Text('Powtarzaj co: ', 
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => _showPeriodPicker(context), 
                        child: Text(
                          _selectedDurationText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => BlocProvider.of<TaskCreationFormCubit>(context).createTask(), 
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          side: BorderSide(
                            color: Colors.black,
                            width: 2
                          )
                        ),
                      ),
                      child: const Text(
                        'Utwórz zadanie',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  void _showPeriodPicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: _kItemExtent,
            scrollController: FixedExtentScrollController(
              initialItem: _selectedDuration,
            ),
            onSelectedItemChanged: (int selectedItem) {
              setState(() {
                _selectedDuration = selectedItem;
              });
            },
            children:
                List<Widget>.generate(_durations.length, (int index) {
              return Center(child: Text(_durations[index].toString()));
            }),
          ),
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context, bool isStart) async {
    final value = await showDatePicker(
      context: context,
      firstDate: isStart ? DateTime.now() : DateTime.parse(_startDate),
      lastDate: DateTime(2025),
    );

    setState(() {
      if(isStart){
        _startDate = formatter.format(value!);
        BlocProvider.of<TaskCreationFormCubit>(context).startDate = value;

        return;
      }

      _endDate = formatter.format(value!);
      BlocProvider.of<TaskCreationFormCubit>(context).endDate = value;
    });
  }

  void _navigateBack() {
    router.go('/');
  }
}