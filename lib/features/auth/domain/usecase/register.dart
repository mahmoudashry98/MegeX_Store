import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/network_exceptions.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthBaseRepository authBaseRepository;

  RegisterUseCase({required this.authBaseRepository});

  Future<Either<NetworkExceptions, Auth>> call(
      RegisterParameters parameters) async {
    return await authBaseRepository.register(parameters: parameters);
  }
}

class RegisterParameters extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;

  const RegisterParameters({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password,name,phone];
}
