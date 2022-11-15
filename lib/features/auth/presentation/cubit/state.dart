import 'package:e_commerce_app/core/errors/network_exceptions.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final PrimaryServerException exception;

  LoginErrorState({required this.exception});
}

class LoginLoadedState extends AuthState {
  final String message;

  LoginLoadedState({this.message = ''});
}
