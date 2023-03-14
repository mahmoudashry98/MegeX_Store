import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/features/caregories/data/repository/category_base_repository.dart';
import 'package:e_commerce_app/features/caregories/domain/entities/category.dart';

import '../../../../core/errors/exceptions.dart';

class GetCategoryUseCase extends BaseUseCase<CategoryEntities, NoParemeters> {
  final CategoryBaseRepository categoryBaseRepository;

  GetCategoryUseCase({required this.categoryBaseRepository});
  @override
  Future<Either<PrimaryServerException, CategoryEntities>> call(
      NoParemeters parameters) async {
    return await categoryBaseRepository.getCategories();
  }
}
