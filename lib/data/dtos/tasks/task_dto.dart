import 'package:hive/hive.dart';

part 'task_dto.g.dart';

@HiveType(typeId: 0)
class TaskDto extends HiveObject {
  @HiveField(0)
  String summary;

  @HiveField(1)
  String description;

  @HiveField(2)
  String startDate;

  @HiveField(3)
  String? endDate;

  @HiveField(4)
  String deadline;
  TaskDto({
    required this.summary,
    required this.description,
    required this.startDate,
    required this.deadline,
    this.endDate,
  });
}
