class Task{
  final String summary;
  final String description;
  final DateTime startDate;
  DateTime? endDate;
  final bool isDone;
  final DateTime deadline;

  Task({required this.summary, required this.description, required this.startDate, required this.isDone, required this.deadline, this.endDate});
}