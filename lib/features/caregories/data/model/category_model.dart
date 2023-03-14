import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/features/caregories/domain/entities/category.dart';

class CategoryModel extends CategoryEntities {
  const CategoryModel({
    required super.status,
    required super.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json[AppString.status],
        data: List<CategoryDataEntities>.from(json['category'].map((x)=>CategoryDataModel.fromJson(x))),
      );
}

class CategoryDataModel extends CategoryDataEntities {
  const CategoryDataModel({
    required super.name,
    required super.image,
    required super.id,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        name: json[AppString.name],
        image: json[AppString.image],
        id: json[AppString.id],
      );
}
