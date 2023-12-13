import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fun/constants.dart';

class AppBlocOberver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    logger.e('Created =>  $bloc ');

    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    logger.d(' Change => ${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.w('Event => ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.w('Transistion =>${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
