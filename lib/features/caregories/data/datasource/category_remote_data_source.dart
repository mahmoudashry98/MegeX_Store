import 'package:e_commerce_app/core/network/end_point.dart';
import 'package:e_commerce_app/core/network/remote/dio_helper.dart';

import '../model/category_model.dart';

abstract class BaseCategoryRemoteDataSource {
  Future<dynamic> getCategories();
}

class CategoryRemoteDataSource extends BaseCategoryRemoteDataSource {
  final DioHelper dioHelper;

  CategoryRemoteDataSource({required this.dioHelper});
  @override
  Future<dynamic> getCategories() async {
    final response = await dioHelper.get(endPoint: EndPoint.categories);
    print("TTTTTTTT$response+++++");
    final categoryModel = CategoryModel.fromJson(response);
    print('categoryModel${categoryModel.data}');
    return categoryModel;
  }
}
