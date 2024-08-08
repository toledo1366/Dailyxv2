import 'package:bloc/bloc.dart';
import 'package:dailyx/domain/models/tasks/task.dart';
import 'package:dailyx/domain/use_cases/tasks/get_tasks_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_page_cubit.freezed.dart';
part 'main_page_state.dart';


@Singleton()
class MainPageCubit extends Cubit<MainPageState>{
  List<Task> tasks = [];

  final GetTasksUseCase _getTasksUseCase;

  MainPageCubit(this._getTasksUseCase) : super(const MainPageState.created());

  void getTasksList() async {
    tasks = [
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
      Task(summary: 'Umyj psa', description: '', startDate: DateTime.now(), isDone: false, deadline: DateTime.now().add(Duration(days: 1))),
    ];
  }
}