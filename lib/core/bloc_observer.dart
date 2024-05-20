import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

class MyGlobalObserver extends BlocObserver {
  MyGlobalObserver({
    Talker? talker,
    this.settings = const TalkerBlocLoggerSettings(),
  }) {
    _talker = talker ?? Talker();
  }

  late Talker _talker;
  final TalkerBlocLoggerSettings settings;

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _talker.logTyped(
      BlocEventLog(
        bloc: bloc,
        event: event,
        settings: settings,
      ),
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _talker.logTyped(BlocStateLog(
      bloc: bloc,
      transition: transition,
      settings: settings,
    ));
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    _talker.logTyped(
      BlocChangeLog(
        bloc: bloc,
        change: change,
        settings: settings,
      ),
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _talker.error('${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _talker.logTyped(BlocCreateLog(bloc: bloc));
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _talker.logTyped(BlocCloseLog(bloc: bloc));
  }
}