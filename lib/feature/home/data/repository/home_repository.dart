import 'package:dartz/dartz.dart';
import 'package:test_task_kanban/core/failuer/failuer.dart';
import 'package:test_task_kanban/feature/home/data/remote/mock_home_remote.dart';
import 'package:test_task_kanban/feature/home/domain/entity/state_entity.dart';
import 'package:test_task_kanban/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final MockHomeRemote _mockHomeRemote;

  HomeRepositoryImpl({
    required MockHomeRemote mockHomeRemote,
  }) : _mockHomeRemote = mockHomeRemote;

  @override
  Future<Either<Failuer, List<StateEntity>>> getData() async {
    try {
      final result = await _mockHomeRemote.getData();
      return right(result);
    } on Exception catch (_) {
      return left(ServerFailure());
    }
  }
}
