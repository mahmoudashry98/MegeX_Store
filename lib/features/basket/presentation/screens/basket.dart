import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/total_price.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Basket',
          color: AppColors.blackColor,
          size: 18.sp,
          fontWeight: AppFontWeight.bold,
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        actions: [
          Image.asset(deleteIcons),
          SizedBox(
            width: context.width * 0.05,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.height * 0.05,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                color: AppColors.paleBlueColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(notificationIcons),
                  SizedBox(
                    width: context.width * 0.02,
                  ),
                  CustomText(
                    text: 'Delivery for FREE until the end of the month',
                    size: 10.sp,
                    color: AppColors.blackColor,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(
                  height: context.height * 0.02,
                ),
                itemBuilder: (context, index) => const BasketItemWidget(),
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            const TotalPriceWidget(
              isUseDiscount: false,
              price: '522',
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: AppString.checkout,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                onTap: () {},
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.18,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              maskGroupImage,
              height: 90.sp,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: context.width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: '2020 Apple iPad Air 10.9"',
                  color: AppColors.blackColor,
                  size: 20.sp,
                  fontWeight: AppFontWeight.semiBold,
                ),
                CustomText(
                  text: '\$579.00',
                  color: AppColors.primaryColor,
                  size: 18.sp,
                  fontWeight: AppFontWeight.semiBold,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'Quantity',
                      color: AppColors.blackColor,
                      size: 15.sp,
                      fontWeight: AppFontWeight.regular,
                    ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                    const PlusAndMinusWidget(
                      operation: '-',
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    CustomText(
                      text: '1',
                      size: 25.sp,
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    const PlusAndMinusWidget(
                      operation: '+',
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

class PlusAndMinusWidget extends StatelessWidget {
  final String operation;
  const PlusAndMinusWidget({
    super.key,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.033,
      width: context.width * 0.07,
      decoration: BoxDecoration(
        color: AppColors.paleBlueColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CustomText(
        text: operation,
        size: 25,
        fontWeight: AppFontWeight.semiBold,
        color: AppColors.whiteColor,
        textAlign: TextAlign.center,
      ),
    );
  }
}
