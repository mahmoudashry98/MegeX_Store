import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/logout.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/profile.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/login.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final GetProfileUseCase getProfileUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getProfileUseCase,
  }) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  Auth? loginModel;

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    var response = await loginUseCase(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
    response.fold(
      (l) {
        emit(LoginErrorState(exception: l));
      },
      (r) {
        loginModel = r;
        emit(LoginLoadedState(message: r.message));
      },
    );
  }

  void register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    var response = await registerUseCase(RegisterParameters(
      name: name,
      phone: phone,
      email: email,
      password: password,
    ));
    response.fold(
      (l) {
        emit(RegisterErrorState(exception: l));
      },
      (r) {
        loginModel = r;
        emit(RegisterLoadedState(message: r.message));
      },
    );
  }

  Auth? logoutModel;
  void logout({
    required String token,
  }) async {
    emit(LogoutLoadingState());
    var response = await logoutUseCase(
      LogoutParameters(
        token: token,
      ),
    );
    response.fold(
      (l) {
        emit(LogoutErrorState(exception: l));
      },
      (r) {
        logoutModel = r;
        emit(LogoutLoadedState(message: r.message));
      },
    );
  }

  Auth? profileModel;
  void getProfile({
    required String token,
  }) async {
    emit(GetProfileLoadingState());
    var response = await getProfileUseCase(
      ProfileParameters(
        token: token,
      ),
    );
    response.fold(
      (l) {
        emit(GetProfileErrorState(exception: l));
      },
      (r) {
        profileModel = r;
        emit(GetProfileLoadedState(message: r.message.toString()));
      },
    );
  }
}
