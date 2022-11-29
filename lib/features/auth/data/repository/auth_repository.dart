import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/network_exceptions.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../domain/usecase/login.dart';
import '../datasource/auth_remote_data_source.dart';

abstract class AuthBaseRepository {
  Future<Either<PrimaryServerException, Auth>> login(
      {required LoginParameters parameters});
  Future<Either<NetworkExceptions, Auth>> register(
      {required RegisterParameters parameters});
}

class AuthRepository extends AuthBaseRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  final DioHelper dioHelper;

  AuthRepository(this.baseAuthRemoteDataSource, this.dioHelper);

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
          error: ''
        )
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
    } catch (e){
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}

