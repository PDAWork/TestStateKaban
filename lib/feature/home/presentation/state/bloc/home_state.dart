part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<StateEntity> states;

  HomeSuccess({required this.states});
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
