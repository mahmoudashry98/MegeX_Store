// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/app_rout.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);

    var facebookUser = AuthCubit.get(context).facebookUser;
    var googleUser = FirebaseAuth.instance.currentUser;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetProfileLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: AppColors.whiteColor,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // color: AppColors.whiteColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: googleUser != null
                                  ? NetworkImage(
                                      googleUser.photoURL!,
                                    )
                                  : facebookUser != null
                                      ? const NetworkImage(
                                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                                        )
                                      : const NetworkImage(
                                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      googleUser != null
                          ? CustomText(
                              text: googleUser.displayName!,
                              color: AppColors.blackColor,
                            )
                          : facebookUser != null
                              ? CustomText(
                                  text: facebookUser['name'],
                                  color: AppColors.blackColor,
                                )
                              : CustomText(
                                  text: cubit.profileModel!.userData!.name,
                                  color: AppColors.blackColor,
                                ),
                      googleUser != null
                          ? CustomText(
                              text: googleUser.email!,
                              color: AppColors.blackColor,
                            )
                          : facebookUser != null
                              ? CustomText(
                                  text: facebookUser['email'],
                                  color: AppColors.blackColor,
                                )
                              : CustomText(
                                  text: cubit.profileModel!.userData!.email,
                                  color: AppColors.blackColor,
                                ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: AppString.logOut,
                        color: AppColors.primaryColor,
                        textColor: AppColors.whiteColor,
                        onTap: () async {
                          await AuthCubit.get(context).logout(
                            context,
                          );

                          await Navigator.pushReplacementNamed(
                            context,
                            AppRouts.loginScreen,
                          );
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
