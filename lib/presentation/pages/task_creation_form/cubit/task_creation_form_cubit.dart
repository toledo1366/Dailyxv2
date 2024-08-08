import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../domain/use_cases/tasks/create_new_task_use_case.dart';

part 'task_creation_form_cubit.freezed.dart';
part 'task_creation_form_state.dart';

@injectable
class TaskCreationFormCubit extends Cubit<TaskCreationFormState>{
  final CreateNewTaskUseCase _useCase;

  TaskCreationFormCubit(this._useCase) : super(const TaskCreationFormState.initialized());

  String title = '';
  String description = '';
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  Jiffy? repeatBy;

  void createTask() async {
    final isAdded = await _useCase.execute(title, description, startDate, endDate, repeatBy);
    
    isAdded ? emit(const TaskCreationFormState.taskCreated()) : emit(TaskCreationFormState.error('error'));
  }
}