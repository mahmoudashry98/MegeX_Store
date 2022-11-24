import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/network_exceptions.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../domain/usecase/login.dart';
import '../datasource/auth_remote_data_source.dart';
import '../model/auth.dart';

abstract class AuthBaseRepository {
  Future<Either<dynamic, Auth>> login(
      {required LoginParameters parameters});
  Future<Either<NetworkExceptions, Auth>> register(
      {required RegisterParameters parameters});
}

class AuthRepository extends AuthBaseRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  final DioHelper dioHelper;

  AuthRepository(this.baseAuthRemoteDataSource, this.dioHelper);

  @override
  Future<Either<dynamic, Auth>> login({
    required LoginParameters parameters,
  }) async {
    try {
      var reponse =
          await baseAuthRemoteDataSource.login(loginParameters: parameters);
      return Right(reponse);
    } catch (e) {
      return Left(
        PrimaryServerException(
          // code: 100,
          // error: 'exception.error',
          message: 'exception.message', status: false,
        ),
      );
    }
  }

  @override
  Future<Either<NetworkExceptions, Auth>> register(
      {required RegisterParameters parameters}) async {
    try {
      var reponse = await baseAuthRemoteDataSource.register(
          registerParameters: parameters);
      return Right(reponse);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}

extension on AuthBaseRepository {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServerException,
    Future<PrimaryServerException> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e, s) {
      debugPrint(s.toString());
      return Left(e);
    }
  }
}
