import 'package:e_commerce_app/config/router/app_rout.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_asstes_path.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: AppString.findYourGadget,
              size: 35.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              height: 300.sp,
              child: Image(
                image: AssetImage(splashImage),
              ),
            ),
            SizedBox(
              height: context.height / 20,
            ),
            CustomButton(
              text: AppString.getStarted,
              color: AppColors.whiteColor,
              textColor: AppColors.primaryColor,
              onTap: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return LoginScreen(
                      transitionAnimation: animation,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            SizedBox(
              height: context.height / 60,
            ),
          ],
        ),
      ),
    );
  }
}
