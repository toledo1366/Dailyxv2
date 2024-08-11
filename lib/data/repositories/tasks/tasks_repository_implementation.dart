import 'package:dailyx/data/dtos/tasks/task_dto.dart';
import 'package:dailyx/domain/repositories/tasks/tasks_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../core/helpers/keys.dart';

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

    final box = await Hive.openBox(tasksKey);

    try{
      final taskRaw = box.get(tasksKey);
      for(var item in taskRaw!){
        tasks.add(item);
      }
      
      box.close();

      return tasks;
    } catch (ex) {
      box.close();

      return [];
    }
  }

  @override
  Future<bool> updateTask(TaskDto task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<bool> createNewTask(List<TaskDto> tasks) async {
    final box = await Hive.openBox(tasksKey);

    try{
      final items = box.get(tasksKey);

      if(items != null){
        box.clear();
        items.addAll(tasks);
        box.put(tasksKey, items);
        box.close();

        return true;
      }

      box.put(tasksKey, tasks);
      box.close();

      return true;
    } catch (ex){
      box.close();

      return false;
    }
  }

}