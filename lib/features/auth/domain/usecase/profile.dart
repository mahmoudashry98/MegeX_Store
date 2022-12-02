import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository.dart';


class GetProfileUseCase extends BaseUseCase<Auth, ProfileParameters>{
  final AuthBaseRepository authBaseRepository;

  GetProfileUseCase({required this.authBaseRepository});

  @override
  Future<Either<PrimaryServerException, Auth>> call(ProfileParameters parameters) async {
    return await authBaseRepository.getProfile(parameters: parameters);
  }
}

class ProfileParameters extends Equatable {
  final String token;
  

  const ProfileParameters({required this.token});

  @override
  List<Object> get props => [token];
}
