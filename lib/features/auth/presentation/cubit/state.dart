import 'package:e_commerce_app/core/errors/exceptions.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

///LoginState
class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final PrimaryServerException exception;

  LoginErrorState({required this.exception});
}

class LoginLoadedState extends AuthState {
  final String message;
  LoginLoadedState({this.message = ''});
}

///RegisterState
class RegisterLoadingState extends AuthState {}

class RegisterErrorState extends AuthState {
  final bool status;
  final String messageError;
  RegisterErrorState({
    required this.messageError,
    required this.status,
  });
}

class RegisterLoadedState extends AuthState {
  final String message;
  RegisterLoadedState({this.message = ''});
}
