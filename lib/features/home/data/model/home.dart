import 'package:e_commerce_app/features/home/domain/entities/home.dart';

import '../../../../core/utils/app_string.dart';

class HomeModel extends HomeEntities {
  const HomeModel({
    required super.status,
    required super.data,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json[AppString.status],
        data: HomeDataModel.fromJson(json[AppString.data]),
      );
}

class HomeDataModel extends HomeDataEntities {
  const HomeDataModel({
    required super.products,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        products: List<ProductEntities>.from(
            json[AppString.products].map((x) => ProductModel.fromJson(x))),
      );
}

class ProductModel extends ProductEntities {
  const ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.inFavorites,
    required super.inCart,
  });

    factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
        id: json[AppString.id],
        price: json[AppString.price].toDouble(),
        oldPrice: json[AppString.oldPrice].toDouble(),
        discount: json[AppString.discount],
        image: json[AppString.image],
        name: json[AppString.name],
        description: json[AppString.description],
        inFavorites: json[AppString.inFavorites],
        inCart: json[AppString.inCart],
      );

}
