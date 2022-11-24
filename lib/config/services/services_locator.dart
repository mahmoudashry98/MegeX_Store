import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/remote/dio_helper.dart';
import '../../features/auth/data/datasource/auth_remote_data_source.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/login.dart';
import '../../features/auth/presentation/cubit/cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    ///cubit
    sl.registerFactory(
      () => AuthCubit(
        loginUseCase: sl(),
      ),
    );

    ///Use cases
    sl.registerLazySingleton(() => LoginUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUseCase(authBaseRepository: sl()));

    ///BaseRepository
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl(), sl()));

    ///BaseRemotDataSource
    sl.registerLazySingleton<DioHelper>(() => DioImpl());
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource(dioHelper: sl()));
  }
}
