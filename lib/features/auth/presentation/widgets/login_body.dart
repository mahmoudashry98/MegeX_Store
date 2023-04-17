import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/router/app_rout.dart';
import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/textFormFiled.dart';
import '../cubit/cubit.dart';

class LoginBody extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginBody({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildListDelegate([
            FadeInLeft(
              child: Container(
                height: context.height,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    topRight: Radius.circular(AppSize.s20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p18),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: AppString.login,
                          size: AppSize.s18,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: context.height / 60,
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
                          height: context.height * 0.0001,
                        ),
                        defaultTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: AppString.hintEmail,
                          hintStyle: TextStyle(
                            color: AppColors.balckColor,
                            fontSize: 14.sp,
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
                          height: context.height / 90,
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
                          height: context.height * 0.0001,
                        ),
                        defaultTextFormField(
                          isPassword: AuthCubit.get(context).isPassword,
                          suffixPressed: () {
                            AuthCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return AppString.formFieldPasswordError;
                            }
                            if (value.length < 7) {
                              return 'Must be more than 7 charater';
                            }
                            return null;
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
                          height: context.height * 0.02,
                        ),
                        Center(
                          child: Column(
                            children: [
                              state is LoginLoadingState
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColors.primaryColor),
                                      ),
                                    )
                                  : CustomButton(
                                      text: AppString.login,
                                      color: AppColors.primaryColor,
                                      textColor: AppColors.whiteColor,
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          AuthCubit.get(context).login(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            context,
                                          );

                                        }
                                      },
                                    ),
                              SizedBox(
                                height: context.height / 60,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRouts.registerScreen,
                                  );
                                },
                                child: CustomText(
                                  text: AppString.createAccount,
                                  color: AppColors.primaryColor,
                                  size: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: context.height / 70,
                              ),
                              CustomText(
                                text: AppString.signWithSocialAccount,
                                color: AppColors.primaryColor,
                                size: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: context.height / 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await AuthCubit.get(context)
                                          .signInWithFacebook(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      height: 32.sp,
                                      width: 32.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.primaryColor,
                                      ),
                                      child: Image.asset(faceBookIcons),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width / 25,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await AuthCubit.get(context)
                                          .signInWithGoogle(context);
                                    },
                                    child: Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SvgPicture.asset(googleIcons),
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
            ),
          ]),
        );
      },
    );
  }
}
