import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/sliver_delegate.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/widgets/custom_text.dart';

class HeaderWidget extends StatelessWidget {
  final String headerName;
  const HeaderWidget({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: context.height * 0.324,
        maxHeight: context.height * 0.011,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p12,
                top: AppPadding.p22,
                right: AppPadding.p12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(ellipse21),
                  ),
                  ZoomIn(
                    child: CircleAvatar(
                      backgroundColor: AppColors.circleColor,
                      radius: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.sp),
              child: FadeInRight(
                child: Column(
                  children: [
                    CustomText(
                      text:headerName,
                      size: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.sp,
                      child: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image(
                              image: AssetImage(ellipse20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
