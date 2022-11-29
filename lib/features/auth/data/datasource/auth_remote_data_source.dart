import 'package:e_commerce_app/core/network/end_point.dart';
import 'package:e_commerce_app/features/auth/data/model/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';

import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/utils/app_string.dart';
import '../../domain/usecase/login.dart';

abstract class BaseAuthRemoteDataSource {
  Future<dynamic> login({required LoginParameters loginParameters});
  Future<AuthModel> register({required RegisterParameters registerParameters});
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final DioHelper dioHelper;
  AuthRemoteDataSource({required this.dioHelper});
  @override
  Future<dynamic> login({
    required LoginParameters loginParameters,
  }) async {
    final response = await dioHelper.post(
      endPoint: EndPoint.login,
      data: {
        AppString.email: loginParameters.email,
        AppString.password: loginParameters.password,
      },
    );
    final authModel = AuthModel.fromJson(response);
    return authModel;
  }

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
    return response;
  }
}
