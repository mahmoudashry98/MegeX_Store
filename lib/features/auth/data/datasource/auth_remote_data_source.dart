import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/network/end_point.dart';
import 'package:e_commerce_app/features/auth/data/model/auth.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/utils/app_string.dart';
import '../../domain/usecase/login.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> login(
      {required LoginParameters loginParameters});
  Future<AuthModel> register({required RegisterParameters registerParameters});
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


  // @override
  // Future<Either<PrimaryServerException, Auth>> login({
  //   required LoginParameters loginParameters,
  // }) async {
  //   var response = await dioHelper.post(
  //     endPoint: EndPoint.login,
  //     data: {
  //       AppString.email: loginParameters.email,
  //       AppString.password: loginParameters.password,
  //     },
  //   );
  //   return response;

  //   // return basicErrorHandling<AuthModel>(
  //   //   onSuccess: () async {
  //   //     var response = await dioHelper.post(
  //   //       endPoint: EndPoint.login,
  //   //       data: {
  //   //         AppString.email: loginParameters.email,
  //   //         AppString.password: loginParameters.password,
  //   //       },
  //   //     );
  //   //     return AuthModel.fromJson(response);
  //   //   },
  //   //   onPrimaryServerException: (e) async {
  //   //     return e;
  //   //   },
  //   // );
  // }

  @override
  Future<AuthModel> register(
      {required RegisterParameters registerParameters}) async {
    var response = await dioHelper.post(
      endPoint: EndPoint.register,
      data: {
        AppString.name: registerParameters.name,
        AppString.phone: registerParameters.phone,
        AppString.email: registerParameters.email,
        AppString.password: registerParameters.password,
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
