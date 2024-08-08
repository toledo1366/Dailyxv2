import '../../../data/dtos/tasks/task_dto.dart';

abstract class TasksRepository{
  Future<List<TaskDto>> getItems();
  Future<bool> createNewTask(TaskDto task);
  Future<bool> updateTask(TaskDto task);
  Future<bool> deleteTask(TaskDto task);
}