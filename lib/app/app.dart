import 'package:flutter/material.dart';
import 'package:test_task_kanban/common/app_theme.dart';
import 'package:test_task_kanban/di/app_depends.dart';
import 'package:test_task_kanban/di/app_depends_provider.dart';
import 'package:test_task_kanban/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key, required this.deps});

  final AppDepends deps;

  @override
  Widget build(BuildContext context) {
    return AppDependsProvider(depends: deps, child: _App());
  }
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: AppRouter.router,
    );
  }
}
