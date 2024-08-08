import 'package:injectable/injectable.dart';

import '../../mappers/tasks/task_mapper.dart';
import '../../models/tasks/task.dart';
import '../../repositories/tasks/tasks_repository.dart';

@injectable
class CreateNewTaskUseCase{
  final TasksRepository _repository;
  final TaskMapper _mapper;

  CreateNewTaskUseCase(this._repository, this._mapper);

  void execute(Task task){
    final taskDto = _mapper.toDto(task);
    _repository.createNewTask(taskDto);
  }
}