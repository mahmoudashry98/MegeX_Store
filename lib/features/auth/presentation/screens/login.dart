import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/config/router/app_rout.dart';
import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/textFormFiled.dart';
import '../widgets/sliver_delegate.dart';

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
          debugPrint('${AppString.messageError} ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is LoginLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
          // debugPrint('${state.status}');
        }
        if (state is RegisterErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is RegisterLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
          // debugPrint('${state.status}');
        }
        if (state is LogoutErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is LogoutLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
          // debugPrint('${state.status}');
        }
      },
      builder: (context, state) {
        print('object');
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
          body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.primaryColor,
                  ),
                );
              } else if (snapshot.hasData) {
                return const HomeScreen();
              } else if (snapshot.hasError) {
                return const Center(
                  child: CustomText(text: 'SomeThing Went Wrong!'),
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: false,
                      floating: false,
                      delegate: SliverAppBarDelegate(
                        minHeight: context.height * 0.324,
                        maxHeight: context.height * 0.011,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p12,
                                top: AppPadding.p22,
                                right: AppPadding.p12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                    image: AssetImage(ellipse21),
                                  ),
                                  ZoomIn(
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.circleColor,
                                      radius: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FadeInRight(
                              child: Column(
                                children: [
                                  CustomText(
                                    text: AppString.welcomeBack,
                                    size: 35.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 30.sp,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image(
                                            image: AssetImage(ellipse20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(
                            height: context.height / 200,
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        FadeInLeft(
                          child: Column(
                            children: [
                              Container(
                                height: context.height / 1.1,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(AppSize.s20),
                                    topRight: Radius.circular(AppSize.s20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p24),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomText(
                                          text: AppString.login,
                                          size: AppSize.s18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        SizedBox(
                                          height: context.height * 0.03,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(emailIcons),
                                            SizedBox(
                                              width: context.width / 45,
                                            ),
                                            CustomText(
                                              text: AppString.Email,
                                              size: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.grey,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: context.height * 0.0002,
                                        ),
                                        defaultTextFormField(
                                          controller: emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          hintText: AppString.hintEmail,
                                          hintStyle: TextStyle(
                                            color: AppColors.balckColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 1,
                                          validate: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                                    .hasMatch(value)) {
                                              return AppString
                                                  .formFieldEmailError;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          height: context.height / 30,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(lockIcons),
                                            SizedBox(
                                              width: context.width / 45,
                                            ),
                                            CustomText(
                                              text: AppString.Password,
                                              size: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.grey,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: context.height / 200,
                                        ),
                                        defaultTextFormField(
                                          isPassword:
                                              AuthCubit.get(context).isPassword,
                                          suffixPressed: () {
                                            AuthCubit.get(context)
                                                .changePasswordVisibility();
                                          },
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return AppString
                                                  .formFieldPasswordError;
                                            } else {
                                              return null;
                                            }
                                          },
                                          controller: passwordController,
                                          hintText: '********',
                                          hintStyle: TextStyle(
                                            color: AppColors.balckColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 1,
                                          suffix: AuthCubit.get(context).suffix,
                                        ),
                                        SizedBox(
                                          height: context.height * 0.02,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: CustomText(
                                            text: AppString.fotgotPassword,
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w600,
                                            size: 10.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: context.height * 0.01,
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              CustomButton(
                                                text: AppString.login,
                                                color: AppColors.primaryColor,
                                                textColor: AppColors.whiteColor,
                                                onTap: () {
                                                  if (formKey.currentState!
                                                      .validate()) {}
                                                },
                                              ),
                                              SizedBox(
                                                height: context.height / 60,
                                              ),
                                              InkWell(
                                                onTap: () => Navigator
                                                    .pushReplacementNamed(
                                                  context,
                                                  AppRouts.registerScreen,
                                                ),
                                                child: CustomText(
                                                  text: AppString.createAccount,
                                                  color: AppColors.primaryColor,
                                                  size: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: context.height / 30,
                                              ),
                                              CustomText(
                                                text: AppString
                                                    .signWithSocialAccount,
                                                color: AppColors.primaryColor,
                                                size: 12.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              SizedBox(
                                                height: context.height / 60,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () => AuthCubit.get(context).signInWithFacebook(),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(8),
                                                      height: 32.sp,
                                                      width: 32.sp,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                      child: Image.asset(
                                                          faceBookIcons),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: context.width / 25,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AuthCubit.get(context)
                                                          .signInWithgoogleLogin();
                                                    },
                                                    child: Container(
                                                      height: 30.sp,
                                                      width: 30.sp,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: SvgPicture.asset(
                                                          googleIcons),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
