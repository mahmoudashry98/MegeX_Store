import 'package:e_commerce_app/core/utils/app_colors.dart';

import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/header.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_text.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: SimpleDialog(
                  insetPadding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                  contentPadding: const EdgeInsets.all(20),
                  children: [
                    CustomText(
                      text: 'Invalid Data',
                      color: AppColors.balckColor,
                      fontWeight: FontWeight.bold,
                      size: 18.sp,
                    ),
                    SizedBox(
                      height: context.height * 0.0022,
                    ),
                    CustomText(
                      text: state.exception.message,
                      color: AppColors.balckColor,
                      size: 18.sp,
                    ),
                    SizedBox(
                      height: context.height * 0.0022,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: CustomText(
                            text: 'Ok',
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
          debugPrint('${AppString.messageError} ${state.exception.message}');
        }
        if (state is RegisterErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
        }
        if (state is RegisterLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
        }
        if (state is LogoutErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
        }
        if (state is LogoutLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
        }
      },
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomScrollView(
              slivers: [
                const HeaderWidget(headerName: AppString.welcomeBack),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: context.height / 200,
                      ),
                    ],
                  ),
                ),
                LoginBody(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
