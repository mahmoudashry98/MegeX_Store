import 'package:e_commerce_app/features/auth/domain/usecase/profile.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:e_commerce_app/features/home/data/repository/home.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/remote/dio_helper.dart';
import '../../features/auth/data/datasource/auth_remote_data_source.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/login.dart';
import '../../features/auth/domain/usecase/logout.dart';
import '../../features/auth/presentation/cubit/cubit.dart';
import '../../features/home/data/datasource/home_remote_data_source.dart';
import '../../features/home/domain/usecase/home.dart';
import '../../features/home/presentation/cubit/cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {

    ///cubit
    sl.registerFactory(
      () => AuthCubit(
        loginUseCase: sl(),
        registerUseCase: sl(),
        logoutUseCase: sl(),
        getProfileUseCase: sl(),
      ),
    );

     sl.registerFactory(
      () => HomeCubit(
        getHomeDataUseCase: sl(),
      ),
    );

    ///Use cases
    sl.registerLazySingleton(() => LoginUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(() => RegisterUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(() => LogoutUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(() => GetProfileUseCase(authBaseRepository: sl()));
    sl.registerLazySingleton(
        () => GetHomeDataUseCase(homeBaseRepository: sl()));

    ///BaseRepository
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));

    sl.registerLazySingleton<HomeBaseRepository>(() => HomeRepository(sl()));

    ///BaseRemotDataSource
    sl.registerLazySingleton<DioHelper>(() => DioImpl());
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource(dioHelper: sl()));
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource(dioHelper: sl()));
  }
}
