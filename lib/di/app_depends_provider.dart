import 'package:flutter/material.dart';
import 'package:test_task_kanban/di/app_depends.dart';

class AppDependsProvider extends InheritedWidget {
  const AppDependsProvider(
      {super.key, required super.child, required this.depends});

  final AppDepends depends;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDepends of(BuildContext context, [bool listen = false]) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<AppDependsProvider>()
        : context.getInheritedWidgetOfExactType<AppDependsProvider>();
        assert(provider != null, "Depends not found");

    return provider!.depends;
  }
}
