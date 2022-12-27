import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/data/datasource/home_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/home.dart';

abstract class HomeBaseRepository {
  Future<Either<PrimaryServerException, HomeEntities>> getHomeData();
}

class HomeRepository extends HomeBaseRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);
  @override
  Future<Either<PrimaryServerException, HomeEntities>> getHomeData() async {
    try {
      var response = await baseHomeRemoteDataSource.getHomeData();
      return Right(response);
    } catch (e) {
      //PrimaryServerException exception = e as PrimaryServerException;

      return Left(
        PrimaryServerException(
          code: 212,
          message: 'exception.message',
          error: '',
        ),
      );
    }
  }
}
