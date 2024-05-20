import 'package:test_task_kanban/feature/home/data/remote/mock_home_remote.dart';
import 'package:test_task_kanban/feature/home/data/repository/home_repository.dart';
import 'package:test_task_kanban/feature/home/domain/repository/home_repository.dart';
import 'package:test_task_kanban/feature/home/domain/use_case/home_use_case.dart';

typedef OnError = void Function(
  String name,
  Object error,
  StackTrace? stackTrace,
);

typedef OnProgress = void Function(
  String name,
  String progress,
);

typedef AddDependsAsync<T> = Future<T> Function();
typedef AddDepends<T> = T Function();

enum _AppDeps {
  mockHomeRemote,
  homeRepository,
  homeUseCase,
}

class AppDepends {
  late final MockHomeRemote _mockHomeRemote;
  late final HomeRepository _homeRepository;
  late final HomeUseCase homeUseCase;

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    _mockHomeRemote = await _addDep<MockHomeRemote>(
      onProgress: onProgress,
      onError: onError,
      appDeps: _AppDeps.mockHomeRemote,
      addDepends: () => MockHomeRemoteImpl(),
    );

    _homeRepository = await _addDep<HomeRepository>(
      onProgress: onProgress,
      onError: onError,
      appDeps: _AppDeps.homeRepository,
      addDepends: () => HomeRepositoryImpl(
        mockHomeRemote: _mockHomeRemote,
      ),
    );

    homeUseCase = await _addDep<HomeUseCase>(
      onProgress: onProgress,
      onError: onError,
      appDeps: _AppDeps.homeUseCase,
      addDepends: () => HomeUseCase(
        homeRepository: _homeRepository,
      ),
    );
  }

  Future<T> _addDep<T>({
    required OnProgress onProgress,
    required OnError onError,
    required _AppDeps appDeps,
    bool isAsync = false,
    AddDepends? addDepends,
    AddDependsAsync? addDependsAsync,
  }) async {
    try {
      final value = isAsync ? await addDependsAsync!() : addDepends!();
      onProgress(
        appDeps.name,
        _calc(appDeps.index),
      );
      return value;
    } on Object catch (error, stackTrace) {
      onError(appDeps.name, error, stackTrace);
      return throw "${appDeps.name}, $error, $stackTrace";
    }
  }

  String _calc(int current) =>
      '${((current + 1) / _AppDeps.values.length * 100).toStringAsFixed(0)}%';
}
