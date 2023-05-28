import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_text.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: AppString.checkout,
            color: AppColors.blackColor,
            size: 18.sp,
            fontWeight: AppFontWeight.bold,
          ),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Shipping information',
                    color: AppColors.blackColor,
                    size: 17.sp,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'change',
                    color: AppColors.primaryColor,
                    size: 15.sp,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(25.sp),
                height: context.height * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    RowOfShippingInformation(
                      image: profileIcons,
                      text: 'Rosina Doe',
                    ),
                    SizedBox(
                      height: context.height * 0.8,
                    ),
                    RowOfShippingInformation(
                      image: locationIcons,
                      text: '43 Oxford Road M13 4GR Manchester, UK',
                    ),
                    SizedBox(
                      height: context.height * 0.8,
                    ),
                    RowOfShippingInformation(
                      image: phoneIcons,
                      text: '+234 9011039271',
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class RowOfShippingInformation extends StatelessWidget {
  String image;
  String text;
  RowOfShippingInformation(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(image),
        SizedBox(
          width: context.width * 0.02,
        ),
        CustomText(
          text: text,
          size: 17.sp,
          fontWeight: AppFontWeight.regular,
        )
      ],
    );
  }
}
