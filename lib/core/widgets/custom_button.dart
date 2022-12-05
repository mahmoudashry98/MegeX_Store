import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_fonts.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        width: 270.sp,
        height: 50.sp,
        child: Center(
          child: CustomText(
            text: text,
            color: textColor,
            size: AppFontSize.s20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
