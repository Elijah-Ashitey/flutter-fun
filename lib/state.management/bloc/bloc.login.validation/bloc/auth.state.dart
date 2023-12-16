part of 'auth.bloc.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthInProgress extends AuthState {}

class AuthSuccess extends AuthState {
  final String username; // it can be a user model
  AuthSuccess(
    this.username,
  );
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(
    this.error,
  );
}
