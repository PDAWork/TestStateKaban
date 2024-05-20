part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInittial extends HomeEvent {}

final class HomeDragTask extends HomeEvent {
  final TaskEntity task;
  final int indexNewState;
  final int indexOldState;
  final int indexTast;
  HomeDragTask({
    required this.task,
    required this.indexNewState,
    required this.indexOldState,
    required this.indexTast,
  });
}
