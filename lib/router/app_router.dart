import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_task_kanban/core/talker.dart';
import 'package:test_task_kanban/di/app_depends_provider.dart';
import 'package:test_task_kanban/feature/home/presentation/state/bloc/home_bloc.dart';
import 'package:test_task_kanban/feature/home/presentation/ui/home_screen.dart';
import 'package:test_task_kanban/router/router_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;
  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [TalkerRouteObserver(talker)],
    routes: [
      GoRoute(
        path: Pages.home.path,
        name: Pages.home.name,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HomeBloc(
              homeUseCase: AppDependsProvider.of(context).homeUseCase,
            )..add(HomeInittial()),
            child: const HomeScreen(),
          );
        },
      )
    ],
  );
}
