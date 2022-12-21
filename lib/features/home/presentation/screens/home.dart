// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_rout.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
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
                      image: NetworkImage(
                        user.photoURL!,
                      ))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: user.displayName!,
            color: AppColors.whiteColor,
          ),
          CustomText(
            text: user.email!,
            color: AppColors.whiteColor,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: AppString.logOut,
            color: AppColors.whiteColor,
            textColor: AppColors.primaryColor,
            onTap: () async {
              await AuthCubit.get(context).logOut();
              Navigator.pushReplacementNamed(
                context,
                AppRouts.loginScreen,
              );
            },
          ),
        ],
      )),
    );
  }
}
