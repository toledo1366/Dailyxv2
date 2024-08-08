import 'package:dailyx/domain/mappers/tasks/task_mapper.dart';
import 'package:dailyx/domain/models/tasks/task.dart';
import 'package:dailyx/domain/repositories/tasks/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTasksUseCase{
  final TaskMapper _mapper;
  final TasksRepository _repository;

  GetTasksUseCase(this._mapper, this._repository);
  
  Future<List<Task>> execute() async {
    final List<Task> tasksList = [];

    final data = await _repository.getItems();

    for (var rawTask in data) {
      tasksList.add(_mapper.fromDto(rawTask));
    }

    return tasksList;
  }
}