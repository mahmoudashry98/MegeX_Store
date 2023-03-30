import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/network/local/shared/shared_preferences.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login.dart';
import 'package:e_commerce_app/features/caregories/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_asstes_path.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../home/presentation/screens/layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var token = CacheHelper.getData(key: 'token');
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
            FadeInDown(
              duration: const Duration(seconds: 3),
              child: CustomText(
                text: AppString.findYourGadget,
                size: 40.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
                textAlign: TextAlign.center,
              ),
            ),
            ElasticIn(
              duration: const Duration(seconds: 3),
              child: SizedBox(
                height: 300.sp,
                child: Image(
                  image: AssetImage(splashImage),
                ),
              ),
            ),
            SizedBox(
              height: context.height / 20,
            ),
            FadeInUp(
              duration: const Duration(seconds: 3),
              child: CustomButton(
                text: AppString.getStarted,
                color: AppColors.whiteColor,
                textColor: AppColors.primaryColor,
                onTap: () async {
                  await CategoriesCubit.get(context).getCategoriesData();

                  if (token == null) {
                    // ignore: use_build_context_synchronously
                    await Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const LoginScreen();
                        },
                        transitionDuration: const Duration(milliseconds: 1200),
                      ),
                    );
                  } else {
                    await AuthCubit.get(context).getProfile(
                      token: CacheHelper.getData(key: 'token'),
                    );
                    await Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const LayoutScreen();
                        },
                        transitionDuration: const Duration(milliseconds: 1200),
                      ),
                    );
                  }
                },
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
