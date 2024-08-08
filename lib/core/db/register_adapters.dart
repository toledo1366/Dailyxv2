import 'package:dailyx/data/dtos/tasks/task_dto.dart';
import 'package:hive/hive.dart';

void registerAdapters(){
  Hive.registerAdapter(TaskDtoAdapter());
}