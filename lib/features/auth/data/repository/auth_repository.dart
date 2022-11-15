import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/network_exceptions.dart';
import 'package:e_commerce_app/features/auth/data/model/auth.dart';
import 'package:e_commerce_app/features/auth/domain/base_repository/login_repository.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';

import '../../domain/usecase/login.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthRepository extends AuthBaseRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<dynamic, Auth>> login({
    required LoginParameters parameters,
  }) async {
    try {
      var reponse =
          await baseAuthRemoteDataSource.login(loginParameters: parameters);
      return Right(reponse);
    } catch (e) {
      
      return Left(PrimaryServerException(
        code: 100,
        error: 'exception.error',
        message: 'exception.message',
      ));
    }
  }

  @override
  Future<Either<dynamic, Auth>> register() {
    throw UnimplementedError();
  }
}
