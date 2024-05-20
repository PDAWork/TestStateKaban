import 'package:dartz/dartz.dart';
import 'package:test_task_kanban/core/failuer/failuer.dart';
import 'package:test_task_kanban/core/use_case/use_case.dart';
import 'package:test_task_kanban/feature/home/domain/entity/state_entity.dart';
import 'package:test_task_kanban/feature/home/domain/repository/home_repository.dart';

class HomeUseCase implements UseCase<Either<Failuer, List<StateEntity>>, Unit> {
  final HomeRepository _homeRepository;

  HomeUseCase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  @override
  Future<Either<Failuer, List<StateEntity>>> call(Unit param) async {
    return await _homeRepository.getData();
  }
}
