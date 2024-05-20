import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_kanban/feature/home/domain/entity/state_entity.dart';
import 'package:test_task_kanban/feature/home/domain/entity/task_entity.dart';
import 'package:test_task_kanban/feature/home/domain/use_case/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc({required this.homeUseCase}) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInittial>((event, emit) async {
      final result = await homeUseCase.call(unit);

      result.fold(
        (error) => emit(HomeError(message: 'Ошибочка какая не знаю')),
        (value) => emit(HomeSuccess(states: value)),
      );
    });

    on<HomeDragTask>((event, emit) {
      if (state is HomeSuccess) {
        final statesList = (state as HomeSuccess).states;
        statesList[event.indexOldState].tasks.removeAt(event.indexTast);

        statesList[event.indexNewState].tasks.add(event.task);
        emit(HomeSuccess(states: statesList));
      }
    });
  }
}
