import 'package:e_commerce_app/core/errors/exceptions.dart';

abstract class AuthState {}

//InitialState
class AuthInitialState extends AuthState {}

//VisibilityState
class ChangePasswordVisibilityState extends AuthState {}

///LoginWithGoogle
class LoginWithGoogleLoadingState extends AuthState {}

class LoginWithGoogleLoadedState extends AuthState {}

class LoginWithGoogleErrorState extends AuthState {
  final String message;

  LoginWithGoogleErrorState({required this.message});
}

///LoginWithFacebook
class LoginWithFacebookLoadingState extends AuthState {}

class LoginWithFacebookLoadedState extends AuthState {}

class LoginWithFacebookErrorState extends AuthState {
  final String message;

  LoginWithFacebookErrorState({required this.message});
}

///logoutSocial
class LogoutSocialLoadingState extends AuthState {}

class LogoutSocialLoadedState extends AuthState {}

class LogoutSocialErrorState extends AuthState {
  final String message;

  LogoutSocialErrorState({required this.message});
}

///LoginState
class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final PrimaryServerException exception;

  LoginErrorState({required this.exception});
}

class LoginLoadedState extends AuthState {
  final String message;
  LoginLoadedState({required this.message});
}

///RegisterState
class RegisterLoadingState extends AuthState {}

class RegisterErrorState extends AuthState {
  final PrimaryServerException exception;

  RegisterErrorState({required this.exception});
}

class RegisterLoadedState extends AuthState {
  final String message;
  RegisterLoadedState({required this.message});
}

///LogoutState
class LogoutLoadingState extends AuthState {}

class LogoutErrorState extends AuthState {
  final PrimaryServerException exception;

  LogoutErrorState({required this.exception});
}

class LogoutLoadedState extends AuthState {
  final String message;
  LogoutLoadedState({required this.message});
}

///GetProfileState
class GetProfileLoadingState extends AuthState {}

class GetProfileErrorState extends AuthState {
  final PrimaryServerException exception;

  GetProfileErrorState({required this.exception});
}

class GetProfileLoadedState extends AuthState {
  final String message;
  GetProfileLoadedState({required this.message});
}

///SaveUserTokenState
class SaveUserTokenLoadingState extends AuthState {}

class SaveUserTokenLoadedState extends AuthState {}
