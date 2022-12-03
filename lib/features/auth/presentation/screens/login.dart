import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          debugPrint('message Error: ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is LoginLoadedState) {
          debugPrint('message success: ${state.message}');
          // debugPrint('${state.status}');
        }
        if (state is RegisterErrorState) {
          debugPrint('message Error: ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is RegisterLoadedState) {
          debugPrint('message success: ${state.message}');
          // debugPrint('${state.status}');
        }
        if (state is LogoutErrorState) {
          debugPrint('message Error: ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is LogoutLoadedState) {
          debugPrint('message success: ${state.message}');
          // debugPrint('${state.status}');
        }
      },
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: AppColors.whiteColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ));
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        AuthCubit.get(context).login(
                          email: 'mahmoud.osama@gmail.com',
                          password: '123456',
                        );
                      },
                      child: const Text('Login')),
                  TextButton(
                      onPressed: () {
                        AuthCubit.get(context).register(
                          name: 'omar ashry',
                          email: 'omar.ashry919@gmail.com',
                          phone: '01111123119',
                          password: '123456',
                        );
                      },
                      child: const Text('register')),
                  TextButton(
                      onPressed: () {
                        var loginModel = AuthCubit.get(context).loginModel;
                        AuthCubit.get(context).logout(
                          token:
                               'n4hrBcXuJ5gA0553qFmncaajyxrPMOjuQuR6Ya2AonRaj1s5p1Aew5URymKxDoPMyPvmAI',
                          //loginModel!.userData!.token,
                        );
                      },
                      child: const Text('logout')),
                  TextButton(
                      onPressed: () {
                        var loginModel = AuthCubit.get(context).loginModel;
                        //print('/////////${loginModel!.userData!.token}');
                        AuthCubit.get(context).getProfile(
                          token: 'q57I4lWQeZ22EuVmO5XwFJvqsjUindCZ9nUhsJIBTBxZpsRIm9RWPZdEmw5V7IShBULbBp',
                          //loginModel!.userData!.token,
                        );
                      },
                      child: const Text('Get Profile')),
                ],
              ),
            ));
      },
    );
  }
}
