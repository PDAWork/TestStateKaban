import 'package:test_task_kanban/feature/home/domain/entity/task_entity.dart';

class StateEntity {
  final int id;
  final String title;
  final List<TaskEntity> tasks;

  StateEntity({
    required this.id,
    required this.title,
    required this.tasks,
  });
}
