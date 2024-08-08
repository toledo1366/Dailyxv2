import 'package:dailyx/data/dtos/tasks/task_dto.dart';
import 'package:dailyx/domain/repositories/tasks/tasks_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TasksRepository)
class TasksRepositoryImplementation implements TasksRepository{
  @override
  Future<bool> deleteTask(TaskDto task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskDto>> getItems() async {
    List<TaskDto> tasks = [];

    final box = await Hive.openBox<TaskDto>('tasks');

    try{
      final task = box.get('tasks');
      tasks.add(task!);

      return tasks;
    } catch (ex) {
      return [];
    }
  }

  @override
  Future<bool> updateTask(TaskDto task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<bool> createNewTask(TaskDto task) async {
    final box = await Hive.openBox<TaskDto>('tasks');

    try{
      box.put('tasks', task);
      box.close();

      return true;
    } catch (ex){
      box.close();

      return false;
    }
  }

}