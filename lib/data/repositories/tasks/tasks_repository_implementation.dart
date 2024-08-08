import 'package:dailyx/data/dtos/tasks/task_dto.dart';
import 'package:dailyx/domain/repositories/tasks/tasks_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TasksRepository)
class TasksRepositoryImplementation implements TasksRepository{
  @override
  Future<bool> deleteTask(TaskDto task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskDto>> getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTask(TaskDto task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<void> createNewTask(TaskDto task) {
    // TODO: implement createNewTask
    throw UnimplementedError();
  }

}