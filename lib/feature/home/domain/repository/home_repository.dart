import 'package:dartz/dartz.dart';
import 'package:test_task_kanban/core/failuer/failuer.dart';
import 'package:test_task_kanban/feature/home/domain/entity/state_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failuer, List<StateEntity>>> getData();
}
