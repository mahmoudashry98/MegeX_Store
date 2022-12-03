import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/logout.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/profile.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../domain/usecase/login.dart';
import '../datasource/auth_remote_data_source.dart';
import '../model/logout.dart';

abstract class AuthBaseRepository {
  Future<Either<PrimaryServerException, Auth>> login(
      {required LoginParameters parameters});
  Future<Either<PrimaryServerException, Auth>> register(
      {required RegisterParameters parameters});
  Future<Either<PrimaryServerException, LogoutModel>> logout(
      {required LogoutParameters parameters});
  Future<Either<PrimaryServerException, Auth>> getProfile(
      {required ProfileParameters parameters});
}

class AuthRepository extends AuthBaseRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<PrimaryServerException, Auth>> login({
    required LoginParameters parameters,
  }) async {
    try {
      var reponse =
          await baseAuthRemoteDataSource.login(loginParameters: parameters);
      return Right(reponse);
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;
      return Left(
        PrimaryServerException(
          message: exception.message,
          code: exception.code,
          error: '',
        ),
      );
    }
  }

  @override
  Future<Either<PrimaryServerException, Auth>> register(
      {required RegisterParameters parameters}) async {
    try {
      var reponse = await baseAuthRemoteDataSource.register(
          registerParameters: parameters);
      return Right(reponse);
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;
      return Left(
        PrimaryServerException(
          message: exception.message,
          code: exception.code,
          error: '',
        ),
      );
    }
  }

  @override
  Future<Either<PrimaryServerException, LogoutModel>> logout(
      {required LogoutParameters parameters}) async {
    try {
      var response =
          await baseAuthRemoteDataSource.logout(logoutParameters: parameters);
      return Right(response);
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;
      return Left(
        PrimaryServerException(
          message: exception.message,
          code: exception.code,
          error: '',
        ),
      );
    }
  }

  @override
  Future<Either<PrimaryServerException, Auth>> getProfile({
    required ProfileParameters parameters,
  }) async {
    try {
      var reponse = await baseAuthRemoteDataSource.getProfile(
          profileParameters: parameters);
      return Right(reponse);
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;
      return Left(
        PrimaryServerException(
          message: exception.message.toString(),
          code: exception.code,
          error: '',
        ),
      );
    }
  }
}
