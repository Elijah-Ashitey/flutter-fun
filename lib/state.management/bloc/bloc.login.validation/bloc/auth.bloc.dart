import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fun/constants.dart';

part 'auth.event.dart';
part 'auth.state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequest);
    on<AuthLogoutRequested>(_onAuthLogoutRequest);
  }
  @override
  void onChange(Change<AuthState> change) {
    logger.f("Auth bloc change --> $change");
    super.onChange(change);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    logger.d("Auth bloc transistion --> $transition");
    super.onTransition(transition);
  }

  _onAuthLoginRequest(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    try {
      final email = event.username;
      final password = event.password;

      if (password.length < 6) {
        return emit(AuthFailure('Password must be at least 6 characters'));
      }
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(
          email,
        ));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  _onAuthLogoutRequest(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(AuthInitial());
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
