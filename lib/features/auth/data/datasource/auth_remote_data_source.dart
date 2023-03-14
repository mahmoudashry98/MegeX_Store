import 'package:e_commerce_app/core/network/end_point.dart';
import 'package:e_commerce_app/features/auth/data/model/auth.dart';
import 'package:e_commerce_app/features/auth/data/model/logout.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/logout.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/profile.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/utils/app_string.dart';
import '../../domain/usecase/login.dart';

abstract class BaseAuthRemoteDataSource {
  Future<dynamic> login({required LoginParameters loginParameters});
  Future<dynamic> register({required RegisterParameters registerParameters});
  Future<dynamic> logout({required LogoutParameters logoutParameters});
  Future<dynamic> getProfile({required ProfileParameters profileParameters});
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final DioHelper dioHelper;
  AuthRemoteDataSource({required this.dioHelper});
  @override
  Future<dynamic> login({
    required LoginParameters loginParameters,
  }) async {
    final response = await dioHelper.post(
      //base: EndPoint.baseUrl1,
      endPoint: EndPoint.login,
      lang: 'en',
      data: {
        AppString.email: loginParameters.email,
        AppString.password: loginParameters.password,
      },

    );
    final loginModel = AuthModel.fromJson(response);
    return loginModel;
  }

  @override
  Future<dynamic> register({
    required RegisterParameters registerParameters,
  }) async {
    var response = await dioHelper.post(
      //base: EndPoint.baseUrl1,
      endPoint: EndPoint.register,
      lang: 'en',
      data: {
        AppString.name: registerParameters.name,
        AppString.phone: registerParameters.phone,
        AppString.email: registerParameters.email,
        AppString.password: registerParameters.password,
      },
    );
    final registerModel = AuthModel.fromJson(response);
    return registerModel;
  }

  @override
  Future<dynamic> logout({required LogoutParameters logoutParameters}) async {
    var response = await dioHelper.post(
      //base: EndPoint.baseUrl1,
      endPoint: EndPoint.logout,
      token: logoutParameters.token,
    );
    final logoutModel = LogoutModel.fromJson(response);
    return logoutModel;
  }

  @override
  Future<dynamic> getProfile(
      {required ProfileParameters profileParameters}) async {
    var response = await dioHelper.get(
      //base: EndPoint.baseUrl1,
      endPoint: EndPoint.profile,
      token: profileParameters.token,
    );
    final profileModel = AuthModel.fromJson(response);
    return profileModel;
  }
}
