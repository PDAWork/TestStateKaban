import 'package:test_task_kanban/feature/home/domain/entity/task_entity.dart';

final class DragTaskEntity {
  final TaskEntity task;
  final int indexTask;
  final int indexOldState;

  DragTaskEntity({
    required this.task,
    required this.indexTask,
    required this.indexOldState,
  });
}
