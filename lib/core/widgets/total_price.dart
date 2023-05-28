import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/app_string.dart';

class TotalPriceWidget extends StatelessWidget {
  final String price;
  final String? oldPrice;
  final bool isUseDiscount;
  final int? discount;
  const TotalPriceWidget({
    super.key,
    required this.price,
    this.oldPrice,
    required this.isUseDiscount,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.totalPrice,
          size: 22.sp,
          fontWeight: AppFontWeight.regular,
          color: AppColors.blackColor,
        ),
        const Spacer(),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 22.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              const TextSpan(text: 'EGP '),
              TextSpan(
                text: price,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        if (isUseDiscount == true)
          if (discount != 0)
            Text(
              oldPrice!,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.lightGrey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
      ],
    );
  }
}
