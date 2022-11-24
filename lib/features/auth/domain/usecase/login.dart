import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';


class LoginUseCase{
  final AuthBaseRepository authBaseRepository;

  LoginUseCase({required this.authBaseRepository});

  Future<Either<dynamic, Auth>> call(LoginParameters loginParameters) async {
    return await authBaseRepository.login(parameters: loginParameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
