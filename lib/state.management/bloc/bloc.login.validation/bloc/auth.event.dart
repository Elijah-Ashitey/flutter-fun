part of 'auth.bloc.dart';

sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String username;
  final String password;
  AuthLoginRequested({
    required this.username,
    required this.password,
  });
}

final class AuthLogoutRequested extends AuthEvent {}
