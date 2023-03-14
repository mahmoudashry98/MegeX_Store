import 'package:equatable/equatable.dart';

class CategoryEntities extends Equatable {
  final bool status;
  final List<CategoryDataEntities> data;

  const CategoryEntities({
    required this.status,
    required this.data,
  });
  @override
  List<Object?> get props => [status, data];
}

class CategoryDataEntities extends Equatable {
  final String name;
  final String image;
  final int id;

  const CategoryDataEntities({
    required this.name,
    required this.image,
    required this.id,
  });
  @override
  List<Object?> get props => [name, image, id];
}
