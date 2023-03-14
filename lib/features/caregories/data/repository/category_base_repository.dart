import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/features/caregories/data/datasource/category_remote_data_source.dart';
import 'package:e_commerce_app/features/caregories/domain/entities/category.dart';

abstract class CategoryBaseRepository {
  Future<Either<PrimaryServerException, CategoryEntities>> getCategories();
}

class CategoryRepository extends CategoryBaseRepository {
  final BaseCategoryRemoteDataSource baseCategoryRemoteDataSource;

  CategoryRepository(this.baseCategoryRemoteDataSource);
  @override
  Future<Either<PrimaryServerException, CategoryEntities>>
      getCategories() async {
    // print('|||||||||||||||||||$response|||||||||||||||||');
    try {
      var response = await baseCategoryRemoteDataSource.getCategories();
      return Right(response);
    } catch (e) {
      return Left(
        PrimaryServerException(
          code: 215,
          message: 'Category message exception',
          error: "",
        ),
      );
    }
    ;
  }
}
