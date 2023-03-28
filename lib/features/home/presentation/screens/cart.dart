import 'package:flutter/material.dart';

import '../../../../core/network/local/shared/shared_preferences.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: CustomButton(
              text: 'Sign Out',
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onTap: () => CacheHelper.removeData,
            ),
          ),
        ],
      ),
    );
  }
}
