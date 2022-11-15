import 'package:dartz/dartz.dart';
import '../entities/auth.dart';
import '../usecase/login.dart';

abstract class AuthBaseRepository {
 
  Future<Either<dynamic, Auth>> login({required LoginParameters parameters});
  Future<Either<dynamic, Auth>> register();
}
