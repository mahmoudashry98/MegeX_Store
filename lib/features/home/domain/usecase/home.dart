import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/features/home/domain/entities/home.dart';

import '../../../../core/errors/exceptions.dart';
import '../../data/repository/home.dart';

class GetHomeDataUseCase extends BaseUseCase<HomeEntities, NoParemeters> {
  final HomeBaseRepository homeBaseRepository;

  GetHomeDataUseCase({required this.homeBaseRepository});

  @override
  Future<Either<PrimaryServerException, HomeEntities>> call(
      NoParemeters parameters) async {
    return await homeBaseRepository.getHomeData();
  }
}
