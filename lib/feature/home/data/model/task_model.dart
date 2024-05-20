import 'package:test_task_kanban/feature/home/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.manager,
    required super.date,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      manager: json['manager'],
      date: DateTime.parse(json['date']),
    );
  }
}
