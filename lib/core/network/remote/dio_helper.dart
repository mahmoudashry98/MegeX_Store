import 'package:dio/dio.dart';

import 'package:e_commerce_app/core/network/end_point.dart';
import 'package:flutter/material.dart';
import '../../../features/auth/data/model/auth.dart';
import '../../errors/exceptions.dart';

abstract class DioHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    int? timeout,
  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    int? timeout,
  });
}

class DioImpl extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
    ),
  );
  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    int? timeout,
    bool isMultipart = false,
  }) async {
    if (timeout != null) {
      dio.options.connectTimeout = timeout;
    }
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };
    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('query => $query');

    return await request(
      call: () async => await dio.get(
        endPoint,
        queryParameters: query,
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    int? timeout,
    bool isMultipart = false,
  }) async {
    if (timeout != null) {
      dio.options.connectTimeout = timeout;
    }
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };
    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('query => $query');

    return await request(
      call: () async => await dio.post(
        endPoint,
        data: data,
        queryParameters: query,
      ),
    );
  }
}

extension on DioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final response = await call.call();
      debugPrint("Response_Data => ${response.data}");
      debugPrint("Response_Code => ${response.statusCode}");
      if (response.statusCode == 200 && response.data['status'] == true) {
        return AuthModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['status'] == false) {
        return PrimaryServerException(
          message: response.data,
          status: response.data,
        );
      }
      // if (r.data[AppString.status] == false) {
      //   throw StatusModel(
      //     status: r.data[AppString.status],
      //     message: r.data[AppString.message],
      //   );
      // }
      return response.data;
    } on DioError catch (e) {
      debugPrint("Error_Message => ${e.message}");
      debugPrint("Error => ${e.error.toString()}");
      debugPrint("Error_Type => ${e.type.toString()}");
      throw PrimaryServerException(
        message: 'error',
        status: false,
      );
    } catch (e) {
      //PrimaryServerException exception = e as PrimaryServerException;
      throw PrimaryServerException(
        message: 'this is an error',
        status: false,
      );
    }
  }
}
