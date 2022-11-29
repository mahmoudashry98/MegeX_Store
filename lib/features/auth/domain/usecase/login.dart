import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/features/auth/data/model/auth.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';


class LoginUseCase extends BaseUseCase<Auth, LoginParameters>{
  final AuthBaseRepository authBaseRepository;

  LoginUseCase({required this.authBaseRepository});

  @override
  Future<Either<PrimaryServerException, Auth>> call(LoginParameters parameters) async {
    return await authBaseRepository.login(parameters: parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
