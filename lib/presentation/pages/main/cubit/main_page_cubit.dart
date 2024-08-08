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

  void getTasksList() async {
    tasks = await _getTasksUseCase.execute();

    if(tasks.isNotEmpty) {
      emit(MainPageState.tasksLoaded(tasks));
    }
  }
}