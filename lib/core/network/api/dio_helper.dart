import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/api/end_point.dart';
import 'package:e_commerce_app/core/errors/network_exceptions.dart';
import 'package:flutter/material.dart';

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
  Future get({
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
  Future post({
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
      final r = await call.call();
      debugPrint("Response_Data => ${r.data}");
      debugPrint("Response_Code => ${r.statusCode}");
      return r.data;
    } on DioError catch (e) {
      debugPrint("Error_Message => ${e.message}");
      debugPrint("Error => ${e.error.toString()}");
      debugPrint("Error_Type => ${e.type.toString()}");
      throw PrimaryServerException(
        code: 100,
        error: 'error Message',
        message: ' message hello from primary exception',
      );
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;
      throw PrimaryServerException(
        code: exception.code,
        error: exception.error,
        message: exception.message,
      );
    }
  }
}
