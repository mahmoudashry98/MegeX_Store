import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/logout.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/profile.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../data/model/logout.dart';
import '../../domain/usecase/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future signInWithgoogleLogin() async {
    emit(LoginWithGoogleLoadingState());
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final gooleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: gooleAuth.idToken,
        accessToken: gooleAuth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      e.toString();
    }

    emit(LoginWithGoogleLoadedState());
  }


  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();
   

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future logOut() async {
    await FacebookAuth.instance.logOut();
    print('$logout');
   // await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

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

  LogoutModel? logoutModel;
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
