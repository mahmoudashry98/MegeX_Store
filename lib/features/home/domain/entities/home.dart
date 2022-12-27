import 'package:equatable/equatable.dart';

class HomeEntities extends Equatable {
  final bool status;
  final HomeDataEntities data;

  const HomeEntities({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class HomeDataEntities {
  final List<ProductEntities> products;

  const HomeDataEntities({
    required this.products,
  });
}

class ProductEntities extends Equatable {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;

  const ProductEntities({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
        inCart,
        inFavorites,
      ];
}
