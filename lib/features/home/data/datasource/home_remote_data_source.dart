import 'package:e_commerce_app/core/network/end_point.dart';
import 'package:e_commerce_app/features/home/data/model/home.dart';

import '../../../../core/network/remote/dio_helper.dart';

abstract class BaseHomeRemoteDataSource {
  Future<dynamic> getHomeData();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final DioHelper dioHelper;

  HomeRemoteDataSource({required this.dioHelper});
  @override
  Future<dynamic> getHomeData() async {
    final response = await dioHelper.get(endPoint: EndPoint.product);
    print("TTTTTTTT$response+++++");
    final homeModel = HomeModel.fromJson(response);
    print('ProductModel${homeModel.data}');

    return homeModel;
  }
}
