import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_values.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  String? hintText,
  String? suffixText,
  TextStyle? hintStyle,
  TextStyle? suffixStyle,
  int? maxLines,
  FormFieldValidator<String>? validate,
  TextInputType? keyboardType,
  ValueChanged<String>? onSubmit,
  ValueChanged? onChanged,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    obscureText: isPassword,
    keyboardType: keyboardType,
    onChanged: onChanged,
    cursorColor: AppColors.primaryColor,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
                color: AppColors.primaryColor,
              ),
            )
          : null,
      suffixText: suffixText,
      suffixStyle: suffixStyle,
      hintText: hintText,
      hintStyle: hintStyle,
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8) )
        ),

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: 0.0,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: 0.0,
        ),
      ),
    ),
    maxLines: maxLines,
    validator: validate,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.balckColor,
    ),
  );
}
