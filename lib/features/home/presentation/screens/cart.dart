import 'package:flutter/material.dart';

import '../../../../config/router/app_rout.dart';
import '../../../../core/network/local/shared/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/presentation/cubit/cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CustomButton(
            text: AppString.logOut,
            color: AppColors.whiteColor,
            textColor: AppColors.primaryColor,
            onTap: () async {
              await CacheHelper.removeData(key: 'token');

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
  }
}
