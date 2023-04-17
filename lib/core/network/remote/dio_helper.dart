import 'package:dio/dio.dart';

import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import '../../errors/exceptions.dart';

abstract class DioHelper {
  Future<dynamic> post({
    String? lang,
    required String endPoint,
    //required String base,
    dynamic data,
    dynamic query,
    String? token,
    int? timeout,
  });

  Future<dynamic> get({
    String? lang,
    required String endPoint,
    //required String base,
    dynamic data,
    dynamic query,
    String? token,
    int? timeout,
  });
}

class DioImpl extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      //baseUrl: EndPoint.baseUrl1,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
    ),
  );

  @override
  Future<dynamic> get({
    String? lang,
    required String endPoint,
    //required String base,
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
      if (lang != null) 'lang': 'en',
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': token,
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
    String? lang,
    required String endPoint,
    //required String base,
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
      if (lang != null) 'lang': 'en',
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': token,
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
    required Future<dynamic> Function() call,
  }) async {
    try {
      final response = await call.call();
      debugPrint("Response_Data => ${response.data}--------------------");
      debugPrint("Response_Code => ${response.statusCode}----------------");
      if (response.data['status'] == false) {
        throw PrimaryServerException(
          message: response.data[AppString.message].toString(),
          error: '',
          code: response.statusCode,
        );
      }
      return response.data;
    } on DioError catch (e) {
      debugPrint("Error_Message => ${e.message.toString()}");
      debugPrint("Error => ${e.error.toString()}");
      debugPrint("Error_Type => ${e.type.toString()}");
      throw PrimaryServerException(
        message: 'message hello from primary exception',
        error: 'error message',
        code: 100,
      );
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;
      throw PrimaryServerException(
        message: exception.message.toString(),
        error: exception.error,
        code: 201,
      );
    }
  }
}
