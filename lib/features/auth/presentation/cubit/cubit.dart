import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/login.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit({
    required this.loginUseCase,
  }) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  Auth? loginModel;

  void login({
    required String email,
    required String password,
  }) async {
   // StatusModel? statusModel;
    emit(LoginLoadingState());
    var response = await loginUseCase(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
    response.fold(
      (l) {
        print('.................$l');
        emit(LoginErrorState(
         exception: l,
        ));
      },
      (r) {
        loginModel = r;
        emit(LoginLoadedState());
      },
    );
  }
}
