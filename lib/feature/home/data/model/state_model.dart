import 'package:test_task_kanban/feature/home/data/model/task_model.dart';
import 'package:test_task_kanban/feature/home/domain/entity/state_entity.dart';

class StateModel extends StateEntity {
  StateModel({
    required super.id,
    required super.title,
    required super.tasks,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      title: json['title'],
      tasks: List<TaskModel>.from(
        json['deals'].map(
          (x) => TaskModel.fromJson(x),
        ),
      ),
    );
  }
}
