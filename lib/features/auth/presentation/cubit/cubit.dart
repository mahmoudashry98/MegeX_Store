import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/logout.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/profile.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/register.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../../../config/router/app_rout.dart';
import '../../../../core/network/local/shared/shared_preferences.dart';
import '../../../home/presentation/cubit/cubit.dart';
import '../../data/model/logout.dart';
import '../../domain/usecase/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  //final SharedPreferencesRepository? sharedPreferencesRepository;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final GetProfileUseCase getProfileUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getProfileUseCase,
    //this.sharedPreferencesRepository
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

  // ignore: prefer_typing_uninitialized_variables
  var facebookUser;

  Future signInWithGoogle(context) async {
    emit(LoginWithGoogleLoadingState());
    try {
      final googleUser = await googleSignIn.signIn();
      print('GoogleUser: $googleUser');
      if (googleUser == null) return;
      _user = googleUser;

      final gooleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: gooleAuth.idToken,
        accessToken: gooleAuth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await saveUserToken(gooleAuth.idToken!);
      HomeCubit.get(context).bottomNavCurrentIndex = 0;

      Navigator.pushReplacementNamed(
        context,
        AppRouts.layoutScreen,
      );
      emit(LoginWithGoogleLoadedState());
    } catch (e) {
      emit(LoginWithGoogleErrorState(
          message: 'errorrrrrrrrrrr ${e.toString()}'));
    }
  }

  Future signInWithFacebook(context) async {
    emit(LoginWithFacebookLoadingState());
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile', 'user_birthday']);

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final userData = await FacebookAuth.instance.getUserData();
      facebookUser = userData;
      // print('GoogleUser: $facebookUser');
      print('Userssssss:$userData');
      print('Uswe:$facebookUser');

      emit(LoginWithFacebookLoadedState());
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await saveUserToken(loginResult.accessToken!.token);
      HomeCubit.get(context).bottomNavCurrentIndex = 0;
      Navigator.pushReplacementNamed(
        context,
        AppRouts.layoutScreen,
      );
    } catch (e) {
      emit(LoginWithFacebookErrorState(message: e.toString()));
    }
  }

  AuthEntities? userLoginModel;

  Future<void> login(
    context, {
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
      (r) async {
        userLoginModel = r;
        await saveUserToken(userLoginModel!.userData!.token);
        HomeCubit homeCubit = HomeCubit.get(context);
        homeCubit.bottomNavCurrentIndex = 0;
        await getProfile(token: CacheHelper.getData(key: 'token'));
        
        emit(LoginLoadedState(message: r.message));
      },
    );
  }

  String? token;

  Future<void> saveUserToken(String userToken) async {
    emit(SaveUserTokenLoadingState());
    try {
      await CacheHelper.saveData(key: 'token', value: userToken);
      print('CachData${CacheHelper.getData(key: 'token')}');
      emit(SaveUserTokenLoadedState());
      token = userToken;
      print('///////////////////////////$token');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> register(
    context, {
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
      (r) async {
        userLoginModel = r;
        await saveUserToken(userLoginModel!.userData!.token);
        Navigator.pushReplacementNamed(
          context,
          AppRouts.layoutScreen,
        );
        emit(RegisterLoadedState(message: r.message));
      },
    );
  }

  LogoutModel? logoutModel;

  Future<void> logout(context) async {
    emit(LogoutLoadingState());
    if (_user != null) {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      _user = null;
    } else if (facebookUser != null) {
      await FacebookAuth.instance.logOut();
      FirebaseAuth.instance.signOut();
      facebookUser = null;
    } else {
      var response = await logoutUseCase(
        LogoutParameters(
          token: profileModel!.userData!.token,
        ),
      );
      response.fold(
        (l) {
          emit(LogoutErrorState(exception: l));
        },
        (r) async {
          logoutModel = r;
          await CacheHelper.removeData(key: 'token');
          HomeCubit.get(context).bottomNavCurrentIndex = 0;
          Navigator.pushReplacementNamed(
            context,
            AppRouts.loginScreen,
          );

          emit(LogoutLoadedState(message: r.message));
        },
      );
    }
  }

  AuthEntities? profileModel;

  Future<void> getProfile({
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
        print('UserModel: $r');
        emit(GetProfileLoadedState(message: r.message.toString()));
      },
    );
  }
}
