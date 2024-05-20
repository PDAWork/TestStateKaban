class TaskEntity {
  final int id;
  final String title;
  final String manager;
  final DateTime date;

  TaskEntity({
    required this.id,
    required this.title,
    required this.manager,
    required this.date,
  });
}
