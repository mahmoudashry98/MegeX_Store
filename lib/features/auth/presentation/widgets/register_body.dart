// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/router/app_rout.dart';
import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/textFormFiled.dart';
import '../cubit/cubit.dart';

class RegisterBody extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  RegisterBody({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildListDelegate([
            FadeInLeft(
              child: Column(
                children: [
                  Container(
                    height: context.height / 1.13,
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
                              height: context.height / 90,
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
                              height: context.height * 0.0001,
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
                              height: context.height / 100,
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
                              height: context.height / 100,
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
                              height: context.height * 0.0001,
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
                              height: context.height / 100,
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
                              isPassword: AuthCubit.get(context).isPassword,
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
                                  return AppString.formFieldPasswordError;
                                }
                                if (value.length < 7) {
                                  return 'Must be more than 7 charater';
                                }
                                return null;
                              },
                              maxLines: 1,
                              suffix: AuthCubit.get(context).suffix,
                            ),
                            SizedBox(
                              height: context.height * 0.02,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  state is! RegisterLoadingState
                                      ? CustomButton(
                                          text: AppString.signUp,
                                          color: AppColors.primaryColor,
                                          textColor: AppColors.whiteColor,
                                          onTap: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              await AuthCubit.get(context)
                                                  .register(
                                                name: nameController.text,
                                                email: emailController.text,
                                                phone: phoneController.text,
                                                password:
                                                    passwordController.text,
                                                context,
                                              );
                                            }
                                          },
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    AppColors.primaryColor),
                                          ),
                                        ),
                                  SizedBox(
                                    height: context.height * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.popAndPushNamed(
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
        );
      },
    );
  }
}
