import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/total_price.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: AppString.shippingInformation,
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
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowOfShippingInformation(
                    image: profileIcons,
                    text: 'Rosina Doe',
                  ),
                  SizedBox(height: context.height * 0.02),
                  RowOfShippingInformation(
                    image: locationIcons,
                    text: '43 Oxford Road M13 4GR\n Manchester, UK S',
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  RowOfShippingInformation(
                    image: phoneIcons,
                    text: '+234 9011039271',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.04,
            ),
            CustomText(
              text: AppString.paymentMethod,
              color: AppColors.blackColor,
              size: 17.sp,
              fontWeight: AppFontWeight.semiBold,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    RadioPaymentMethodWidget(
                      value: 1,
                      groupValue: 1,
                      image: visaImage,
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    RadioPaymentMethodWidget(
                      value: 2,
                      groupValue: 1,
                      image: mastercardImage,
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    RadioPaymentMethodWidget(
                      value: 3,
                      groupValue: 1,
                      image: maskGroupImage,
                    ),
                  ]),
            ),
            SizedBox(
              height: context.height * 0.06,
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
                onTap: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Confirm and pay',
                                    color: AppColors.blackColor,
                                    size: 17.sp,
                                    fontWeight: AppFontWeight.semiBold,
                                  ),
                                  const Spacer(),
                                  CustomText(
                                    text: 'Products: 2',
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
                                height: context.height * 0.25,
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText(
                                          text: 'My credit card',
                                          size: 17.sp,
                                          color: AppColors.blackColor,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          height: 40.sp,
                                          width: 62.sp,
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Image.asset(visaImage),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                  // Navigator.pushNamed(
                  //     context, AppRouts.floatingActionButtonWidget);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioPaymentMethodWidget extends StatelessWidget {
  final int value;
  final int groupValue;
  final String image;
  const RadioPaymentMethodWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: AppColors.primaryColor,
          value: value,
          groupValue: groupValue,
          onChanged: (value) {},
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 40.sp,
          width: 62.sp,
          decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(image),
        ),
        SizedBox(
          width: context.width * 0.02,
        ),
        CustomText(
          text: '**** **** **** 1234',
          size: 20.sp,
          color: AppColors.blackColor,
          fontWeight: AppFontWeight.regular,
        ),
      ],
    );
  }
}

class RowOfShippingInformation extends StatelessWidget {
  final String image;
  final String text;
  const RowOfShippingInformation(
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
        Expanded(
          child: CustomText(
            text: text,
            size: 17.sp,
            fontWeight: AppFontWeight.regular,
          ),
        )
      ],
    );
  }
}
