import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';


class LogoutUseCase extends BaseUseCase<Auth, LogoutParameters>{
  final AuthBaseRepository authBaseRepository;

  LogoutUseCase({required this.authBaseRepository});

  @override
  Future<Either<PrimaryServerException, Auth>> call(LogoutParameters parameters) async {
    return await authBaseRepository.logout(parameters: parameters);
  }
}

class LogoutParameters extends Equatable {
  final String token;

  const LogoutParameters({ required this.token});

  @override
  List<Object> get props => [token];
}
