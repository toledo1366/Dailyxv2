import 'package:bloc/bloc.dart';
import 'package:dailyx/domain/models/tasks/task.dart';
import 'package:dailyx/domain/use_cases/tasks/get_tasks_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_page_cubit.freezed.dart';
part 'main_page_state.dart';


@injectable
class MainPageCubit extends Cubit<MainPageState>{
  List<Task> tasks = [];

  final GetTasksUseCase _getTasksUseCase;

  MainPageCubit(this._getTasksUseCase) : super(const MainPageState.created());

  void getTasksList(DateTime selectedDate) async {
    emit(const MainPageState.loading());

    if(tasks.isEmpty){
      tasks = await _getTasksUseCase.execute();
    }

    final List<Task> tasksForSelectedDate = [];

    for(var task in tasks){
      if(selectedDate.isAfter(task.startDate) && selectedDate.isBefore(task.deadline.add(const Duration(days: 1)))){
        tasksForSelectedDate.add(task);
      }
    }

    if(tasksForSelectedDate.isNotEmpty) {
      emit(MainPageState.tasksLoaded(tasksForSelectedDate));

      return;
    }

    emit(const MainPageState.error('Brak zadań na dziś'));
  }



  String calculateTaskEndTime(Task task){
    final lasts = task.deadline.difference(task.startDate).inDays;

    return 'Pozostało $lasts dni';
  }
}