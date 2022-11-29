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
              child: TextButton(
                  onPressed: () {
                    AuthCubit.get(context).login(
                      email: 'mahmoud.osama@gmail.com',
                      password: '123456',
                    );
                  },
                  child: Text('Login'))),
        );
      },
    );
  }
}
