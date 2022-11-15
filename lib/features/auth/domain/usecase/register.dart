import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/domain/base_repository/login_repository.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';


class RegisterUseCase {
  final AuthBaseRepository authBaseRepository;

  RegisterUseCase(this.authBaseRepository);

  Future<Either<dynamic, Auth>> execute() async {
    return await authBaseRepository.register();
  }
}
