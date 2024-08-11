import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';

import '../../mappers/tasks/task_mapper.dart';
import '../../models/tasks/task.dart';
import '../../repositories/tasks/tasks_repository.dart';

@injectable
class CreateNewTaskUseCase{
  final TasksRepository _repository;
  final TaskMapper _mapper;

  CreateNewTaskUseCase(this._repository, this._mapper);

  Future<bool> execute(String title, String description, DateTime startDate, DateTime? endDate, Jiffy? repeatBy) async {
    final Task task = Task(summary: title, description: description, startDate: startDate, isDone: false, deadline: endDate!);
    final taskDto = _mapper.toDto(task);
    final isCompleted = await _repository.createNewTask([taskDto]);

    return isCompleted; 
  }
}