

import 'package:injectable/injectable.dart';

import '../../../data/dtos/tasks/task_dto.dart';
import '../../models/tasks/task.dart';
import '../base_mapper.dart';

@injectable
class TaskMapper extends BaseMapper<TaskDto, Task>{
  @override
  Task fromDto(TaskDto dto) {
    return Task(
      summary: dto.summary, 
      description: dto.description, 
      startDate: DateTime.parse(dto.startDate), 
      isDone: dto.endDate != null,
      endDate: dto.endDate != null ? DateTime.parse(dto.endDate!) : null,
      deadline: DateTime.now()
    );
  }

  @override
  TaskDto toDto(Task model) {
    return TaskDto(
      summary: model.summary, 
      description: model.description, 
      startDate: model.startDate.toString(),
      endDate: model.endDate?.toString(),
      deadline: model.endDate.toString()
    );
  }
  
}