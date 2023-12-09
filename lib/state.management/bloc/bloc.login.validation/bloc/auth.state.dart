part of 'auth.bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthInProgress extends AuthState {}

final class AuthSuccess extends AuthState {
  final String username; // it can be a user model
  AuthSuccess(
    this.username,
  );
}

final class AuthFailure extends AuthState {
  final String error;
  AuthFailure(
    this.error,
  );
}
