import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/network_exceptions.dart';
import 'package:e_commerce_app/core/network/api/dio_helper.dart';
import 'package:e_commerce_app/core/network/api/end_point.dart';
import 'package:e_commerce_app/features/auth/data/model/auth.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/login.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> login({
    required LoginParameters loginParameters,
  });
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final DioHelper dioHelper;
  AuthRemoteDataSource({required this.dioHelper});

  @override
  Future<AuthModel> login({
    required LoginParameters loginParameters,
  }) async {
    final response = await dioHelper.post(
      endPoint: EndPoint.login,
      data: {
        'email': loginParameters.email,
        'password': loginParameters.password,
      },
    );

    return AuthModel.fromJson(response);
  }
}

extension on BaseAuthRemoteDataSource {
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
