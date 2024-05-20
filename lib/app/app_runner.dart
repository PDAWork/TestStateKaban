import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:test_task_kanban/app/app.dart';
import 'package:test_task_kanban/core/bloc_observer.dart';
import 'package:test_task_kanban/core/talker.dart';
import 'package:test_task_kanban/di/app_depends.dart';

class AppRunner {
  Future<void> run() async {
    runZonedGuarded(
      () async {
        await _initApp();
       await  initializeDateFormatting('ru_RU', null);
        final deps = AppDepends();
        await deps.init(
          onError: (name, error, stackTrace) {
            throw '$name, $error, $stackTrace';
          },
          onProgress: (name, progress) {
            talker.info("Init $name success $progress");
          },
        );

        Bloc.observer = MyGlobalObserver(
          talker: talker,
          settings: const TalkerBlocLoggerSettings(),
        );
        FlutterError.onError =
            (details) => talker.handle(details.exception, details.stack);

        runApp(App(deps: deps));

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          WidgetsBinding.instance.allowFirstFrame();
        });
      },
      (error, stack) {
        talker.handle(error.toString(), stack);
        runApp(
          _AppError(
            message: 'error: $error,\n stack: $stack',
          ),
        );
      },
    );
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}

class _AppError extends StatelessWidget {
  const _AppError({required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text(message)),
      ),
    );
  }
}
