import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/router/app_rout.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/textFormFiled.dart';
import '../widgets/sliver_delegate.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
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
                SliverPersistentHeader(
                  pinned: false,
                  floating: false,
                  delegate: SliverAppBarDelegate(
                    minHeight: context.height * 0.324,
                    maxHeight: context.height * 0.011,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p12,
                        top: AppPadding.p22,
                        right: AppPadding.p12,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: AppPadding.p12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: AssetImage(ellipse21),
                                ),
                                CircleAvatar(
                                  backgroundColor: AppColors.circleColor,
                                  radius: 25,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.sp),
                            child: FadeInRight(
                              child: Column(
                                children: [
                                  CustomText(
                                    text: AppString.signUpAndEnjoy,
                                    size: 40.sp,
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
                          ),
                        ],
                      ),
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
                            height: context.height,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: AppString.signUp,
                                      size: AppSize.s18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.012,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(profileIcons),
                                        SizedBox(
                                          width: context.width / 45,
                                        ),
                                        CustomText(
                                          text: AppString.userName,
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
                                      controller: nameController,
                                      keyboardType: TextInputType.name,
                                      hintText: AppString.hintName,
                                      hintStyle: TextStyle(
                                        color: AppColors.balckColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return AppString.formFieldNameError;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: context.height * 0.012,
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
                                      keyboardType: TextInputType.emailAddress,
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
                                          return AppString.formFieldEmailError;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: context.height * 0.012,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(phoneIcons),
                                        SizedBox(
                                          width: context.width / 45,
                                        ),
                                        CustomText(
                                          text: AppString.Phone,
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
                                      controller: phoneController,
                                      keyboardType: TextInputType.number,
                                      hintText: AppString.hintPhone,
                                      hintStyle: TextStyle(
                                        color: AppColors.balckColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return AppString.formFieldPhoneError;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: context.height * 0.012,
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
                                      height: context.height * 0.0002,
                                    ),
                                    defaultTextFormField(
                                      isPassword:
                                          AuthCubit.get(context).isPassword,
                                      suffixPressed: () {
                                        AuthCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      controller: passwordController,
                                      hintText: '********',
                                      hintStyle: TextStyle(
                                        color: AppColors.balckColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return AppString
                                              .formFieldPasswordError;
                                        } else {
                                          return null;
                                        }
                                      },
                                      maxLines: 1,
                                      suffix: AuthCubit.get(context).suffix,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.04,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          CustomButton(
                                            text: AppString.signUp,
                                            color: AppColors.primaryColor,
                                            textColor: AppColors.whiteColor,
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {}
                                            },
                                          ),
                                          SizedBox(
                                            height: context.height / 50,
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                Navigator.popAndPushNamed(
                                              context,
                                              AppRouts.loginScreen,
                                            ),
                                            child: CustomText(
                                              text: AppString.login,
                                              color: AppColors.primaryColor,
                                              size: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
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
            ),
          ),
        );
      },
    );
  }
}
